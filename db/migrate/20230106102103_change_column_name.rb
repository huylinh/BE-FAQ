class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :titles, :title, :name
  end
end
