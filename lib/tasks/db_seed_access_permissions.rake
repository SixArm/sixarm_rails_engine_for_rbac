namespace :db do
  namespace :seed do
    namespace :access do
      task :permissions => %w(environment db:seed:access:roles db:seed:access:operations) do
        path=Rails.root.join('db','seeds','access_permissions.tdf')
        File.readrows(path).each{|row|

          ## Input
          role_xid,operation_xid=row

          ## Lookup
	  (role=AccessRole.find_by_xid(role_xid)) or raise "Cannot find role by xid:#{role_xid}"
	  (operation=AccessOperation.find_by_xid(operation_xid)) or raise "Cannot find operation by xid:#{operation_xid}"

          ## Insert
          pp "db:seed:access:permissions role xid:#{role_xid} id:#{role.id} name:#{role.name} operation xid:#{operation_xid} id:#{operation.id} name:#{operation.name}"
	  AccessPermission.seed([:access_role_id,:access_operation_id],{:access_role_id=>role.id,:access_operation_id=>operation.id})

        }
      end
    end
  end
end
