def reconnect!
  ActiveRecord::Base.connection_proxy.instance_variable_get(:@shards).each {|k,v| v.clear_reloadable_connections! }.present?
end
