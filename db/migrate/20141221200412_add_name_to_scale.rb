class AddNameToScale < ActiveRecord::Migration
  def change
    add_column :scales, :name, :string
  end
end
