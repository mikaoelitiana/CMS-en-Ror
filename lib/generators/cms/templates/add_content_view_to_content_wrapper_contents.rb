class AddContentViewToContentWrapperContents < ActiveRecord::Migration
  def self.up
    add_column :content_wrapper_contents, :content_view, :string
  end

  def self.down
    remove_column :content_wrapper_contents, :content_view
  end
end
