#!/usr/bin/env bun
import { CompilerOptions } from 'typescript';
import { ModuleResolutionKind, resolveModuleName } from 'typescript';

import { Project, ts } from 'ts-morph';
import path from 'path';
import fs from 'fs';

function resolvePath(tsConfig: CompilerOptions, moduleSpecifier: string, containingFile: string): string | null {
  const { resolvedModule } = resolveModuleName(
    moduleSpecifier,
    containingFile,
    tsConfig,
    {
      fileExists: fs.existsSync,
      readFile: (path: string) => fs.readFileSync(path, 'utf8'),
    }
  );

  if (resolvedModule) {
    return resolvedModule.resolvedFileName;
  }

  const resolvedPaths = [
    path.resolve(path.dirname(containingFile), moduleSpecifier + ".ts"),
    path.resolve(path.dirname(containingFile), moduleSpecifier + ".tsx"),
    path.resolve(path.dirname(containingFile), moduleSpecifier, "index.ts"),
    path.resolve(path.dirname(containingFile), moduleSpecifier, "index.tsx")
  ];

  for (const resolvedPath of resolvedPaths) {
    if (fs.existsSync(resolvedPath)) {
      return resolvedPath;
    }
  }

  return null;
}

function findImportPath(from: string, to: string): string[] | null {
  const project = new Project({
    tsConfigFilePath: "tsconfig.json"
  });

  const tsConfig = project.getCompilerOptions();
  const baseUrl = tsConfig.baseUrl || '.';
  const paths = tsConfig.paths || {};

  const sourceFile = project.addSourceFileAtPath(from);
  const targetFilePath = path.resolve(to);

  const visitedFiles = new Set<string>();
  const importStack: string[] = [];

  function visitFile(filePath: string): boolean {
    if (visitedFiles.has(filePath)) {
      return false;
    }
  
    visitedFiles.add(filePath);
    const file = project.getSourceFile(filePath);
    if (!file) {
      return false;
    }
  
    importStack.push(filePath);
  
    if (filePath === targetFilePath) {
      return true;
    }
  
    for (const importDeclaration of file.getImportDeclarations()) {
      const moduleSpecifier = importDeclaration.getModuleSpecifierValue();
      const resolvedPath = resolvePath(tsConfig, moduleSpecifier, filePath);
  
      if (resolvedPath && visitFile(resolvedPath)) {
        return true;
      }
    }

      // Add support for `export * from ...` statements
  for (const exportDeclaration of file.getExportDeclarations()) {
    const moduleSpecifier = exportDeclaration.getModuleSpecifierValue();
    if (moduleSpecifier) {
      const resolvedPath = resolvePath(tsConfig, moduleSpecifier, filePath);

      if (resolvedPath && visitFile(resolvedPath)) {
        return true;
      }
    }
  }
  
    importStack.pop();
    return false;
  }  

  if (visitFile(path.resolve(from))) {
    return importStack;
  }

  return null;
}


function main() {
  if (process.argv.length !== 4) {
    console.error('Usage: ts-import-trace path/to/1.ts path/to/2.ts');
    process.exit(1);
  }

  const from = process.argv[2];
  const to = process.argv[3];

  if (!fs.existsSync(from) || !fs.existsSync(to)) {
    console.error('Error: One or both of the specified files do not exist.');
    process.exit(1);
  }

  const importPath = findImportPath(from, to);
  if (importPath) {
    console.log(importPath.join('\n'));
  } else {
    console.log(`No path found from ${from} to ${to}`);
  }
}

main();

