class AddReplayCodeToReplays < ActiveRecord::Migration
  def change
    add_column :replays, :replay_file, :string
  end
end
