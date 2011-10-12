class CreateFreeContents < ActiveRecord::Migration
  def self.up
    create_table :free_contents do |t|
      t.string :name
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :free_contents
  end
end
