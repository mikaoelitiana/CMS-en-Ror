class CreateContainers < ActiveRecord::Migration
  def self.up
    create_table :containers do |t|
      t.string :name
      t.string :title
      t.string :subtitle
      t.string :keywords
      t.string :description
      t.string :browser_title

      t.timestamps
    end
  end

  def self.down
    drop_table :containers
  end
end
