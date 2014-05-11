require "active_record"
require "yaml"
require "erb"
require "./app/models/hoges"


db_conf = YAML.load( ERB.new( File.read("./config/database.yml") ).result )

# 開発用DB接続パラメータ読み込み, 接続する
ActiveRecord::Base.establish_connection(db_conf["db"]["development"])


test_name = "momota.txt"
test_url  = "http://momota.github.io/"

rec = Hoges.find_by url: test_url
unless rec
  hoge = Hoges.new { |h|
    h.name = test_name
    h.url  = test_url
  }
  hoge.save
  puts "すでにデータは insert 済みなのでここには入らない"
end

p rec
