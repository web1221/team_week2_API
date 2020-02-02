# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks
desc 'Create a database dump'
task :dump, [:db_name] do |t, args|
  system("pg_dump #{args.db_name} > database_backup.sql")
end

desc 'Create a database and test database from a database dump'
task :build, [:db_name] do |t, args|
  system("createdb #{args.db_name}")
  system("psql #{args.db_name} < database_backup.sql")
  system("createdb -T #{args.db_name} #{args.db_name + '_test'}")
end
