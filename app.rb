require "active_record"
require "yaml"
require "erb"
require "./app/models/hoges"


db_conf = YAML.load( ERB.new( File.read("./config/database.yml") ).result )

# 開発用DB接続パラメータ読み込み, 接続する
ActiveRecord::Base.establish_connection(db_conf["db"]["development"])


test_name = "momota.txt"
test_url  = "http://momota.github.io/"

hoges = Hoges.find_or_create_by( url: test_url ) do |h|
  h.name = test_name
end

puts "[before delete]record count: #{Hoges.count}"
Hoges.delete_all(url: test_url)
puts "[after delete] record count: #{Hoges.count}"
