class AddFpToReplays < ActiveRecord::Migration
  def change
    add_column :replays, :fp, :text, :default => ""
  end
end
