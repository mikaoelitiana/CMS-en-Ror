class AddScriptToFreeContents < ActiveRecord::Migration
  def self.up
    add_column :free_contents, :script, :text
  end

  def self.down
    remove_column :free_contents, :script
  end
end
