class AddUploaderIdToReplays < ActiveRecord::Migration
  def change
    add_column :replays, :user_id, :integer, :default => nil
  end
end
