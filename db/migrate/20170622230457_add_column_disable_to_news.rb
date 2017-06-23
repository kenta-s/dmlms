class AddColumnDisableToNews < ActiveRecord::Migration[5.1]
  def up
    add_column :news, :disable, :boolean, default: false
    change_column :news, :disable, :boolean, default: false, null: false # A hack for SQLite3
  end

  def down
    remove_column :news, :disable
  end
end
