class AddColumnDisableToNews < ActiveRecord::Migration[5.1]
  def change
    add_column :news, :disable, :boolean, null: false, default: false
  end
end
