class CreateContentWrappers < ActiveRecord::Migration
  def self.up
    create_table :content_wrappers do |t|
      t.string :name
      t.string :tags

      t.timestamps
    end
  end

  def self.down
    drop_table :content_wrappers
  end
end
