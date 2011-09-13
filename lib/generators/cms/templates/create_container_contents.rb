class CreateContainerContents < ActiveRecord::Migration
  def self.up
    create_table :container_contents do |t|
      t.integer :content_id
      t.string :content_type
      t.string :container_id
      t.string :content_view
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :container_contents
  end
end
