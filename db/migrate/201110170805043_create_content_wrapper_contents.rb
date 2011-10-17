class CreateContentWrapperContents < ActiveRecord::Migration
  def self.up
    create_table :content_wrapper_contents do |t|
      t.string :name
      t.integer :content_wrapper_id
      t.string :content_id
      t.string :content_type
      t.string :tags
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :content_wrapper_contents
  end
end
