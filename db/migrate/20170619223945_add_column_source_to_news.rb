class AddColumnSourceToNews < ActiveRecord::Migration[5.1]
  def up
    add_column :news, :source, :string
    change_column :news, :source, :string, null: false # A hack for SQLite3
  end

  def down
    remove_column :news, :source
  end
end
