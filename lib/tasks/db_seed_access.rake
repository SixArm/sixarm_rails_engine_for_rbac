namespace :db do
  namespace :seed do
    task :access =>  %w(environment db:seed:access:roles db:seed:access:assignments db:seed:access:operations db:seed:access:permissions) do
    end
  end
end
