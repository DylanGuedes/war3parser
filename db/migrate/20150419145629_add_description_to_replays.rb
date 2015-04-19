class AddDescriptionToReplays < ActiveRecord::Migration
  def change
    add_column :replays, :description, :text, :default => " "
  end
end
