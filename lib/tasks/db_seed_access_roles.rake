namespace :db do
  namespace :seed do
    namespace :access do
      task :roles => %w(environment) do
        path=Rails.root.join('db','seeds','access_roles.tdf')
        File.readrows(path).each{|row|

          ## Input
          xid,name=row

          ## Insert
          pp "db:seed:access:roles xid:#{xid} name:#{name}"
	  AccessRole.seed(:xid,{:xid=>xid,:name=>name})

        }
      end
    end
  end
end
