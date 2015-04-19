class CreateReplayHeaders < ActiveRecord::Migration
  def change
    create_table :replay_headers do |t|
      t.integer :version, default: 0
      t.text :intro, default: ""
      
      t.timestamps null: false
    end
  end
end
