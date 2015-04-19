class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.text :content
      t.string :subject
      t.string :author

      t.timestamps null: false
    end
  end
end
