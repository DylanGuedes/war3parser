class CreateReplays < ActiveRecord::Migration
  def change
    create_table :replays do |t|
      t.boolean :parse_actions, default: true
      t.boolean :parse_chat, default: true
      t.string :file_name
      t.text :header

      t.timestamps null: false
    end
  end
end
