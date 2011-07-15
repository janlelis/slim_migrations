namespace :slim_migrations do
  desc "Update all current old-style migrations to slim migration syntax"
  task :update_syntax do
     Dir["db/migrate/[0-9]*_*.rb"].each{ |migration_path|
       migration_content = File.read migration_path
       if migration_content =~ /^[^#]*class\s+[A-Za-z0-9_]+\s*<\s*ActiveRecord::Migration/
         puts "Upgrading: #{migration_path}"
         migration_content.gsub! /class\s+[A-Za-z0-9_]+\s*<\s*ActiveRecord::Migration/, 'migration do'
         migration_content.gsub! /self\.(up|down)/, '\1'
         File.open(migration_path, 'w') do |file| file.write migration_content end
       end
     }
  end
end
