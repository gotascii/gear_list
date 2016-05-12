class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.integer :function_id
      t.string :name
      t.decimal :weight
    end
  end

  def self.down
    drop_table :items
  end
end
