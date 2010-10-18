namespace :db do
  namespace :seed do
    namespace :access do
      task :assignments => %w(environment db:seed:access:roles) do
        path=Rails.root.join('db','seeds','access_assignments.tdf')
        File.readrows(path).each{|row|

          ## Input
          username,role_xid=row

          ## Lookup
	  (user=User.find_by_username(username)) or raise "Cannot find user by username:#{username}"
	  (role=AccessRole.find_by_xid(role_xid)) or raise "Cannot find role by xid:#{role_xid}"

          ## Insert
          pp "db:seed:access:assignments username:#{username} id:#{user.id} role xid:#{role_xid} id:#{role.id}"
	  AccessAssignment.seed([:user_id,:access_role_id],{:user_id=>user.id,:access_role_id=>role.id})

        }
      end
    end
  end
end
