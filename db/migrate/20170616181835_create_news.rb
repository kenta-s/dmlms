class CreateNews < ActiveRecord::Migration[5.1]
  def change
    create_table :news do |t|
      t.string :key, null: false
      t.text :content, null: false
      t.string :label

      t.timestamps
    end
    add_index :news, :key
  end
end
