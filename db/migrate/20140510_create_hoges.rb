class CreateHoges < ActiveRecord::Migration
  def self.up
    create_table :hoges do |t|
      t.string  :name
      t.string  :url
      t.timestamps  # => これでcreated_atとupdated_atカラムが定義される
    end
  end

  def self.down
    drop_table :hoges
  end
end
