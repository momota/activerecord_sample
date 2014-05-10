require "active_record"
require "yaml"
require "erb"
require "logger"


task :default => :migrate

desc "Migrate database"
task :migrate => :environment do
  ActiveRecord::Migrator.migrate('db/migrate', ENV["VERSION"] ? ENV["VERSION"].to_i : nil )
end

task :environment do
  db_conf = YAML.load( ERB.new( File.read("./config/database.yml") ).result )

  # `rake ENV=development`/`rake ENV=production`で切り替え可能
  ActiveRecord::Base.establish_connection( db_conf["db"][ENV["ENV"]] )
  ActiveRecord::Base.logger = Logger.new("log/database.log")
end
