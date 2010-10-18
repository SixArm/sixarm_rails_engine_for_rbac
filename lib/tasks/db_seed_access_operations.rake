namespace :db do
  namespace :seed do
    namespace :access do
      task :operations => %w(environment) do
        path=Rails.root.join('db','seeds','access_operations.tdf')
        File.readrows(path).each{|row|

          ## Input
          xid,name=row

          ## Insert
          pp "db:seed:access:operations xid:#{xid} name:#{name}"
	  AccessOperation.seed(:xid,{:xid=>xid,:name=>name})

        }
      end
    end
  end
end
