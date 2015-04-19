class AddDataToReplays < ActiveRecord::Migration
  def change
    add_column :replays, :data, :text, :default => ""
  end
end
