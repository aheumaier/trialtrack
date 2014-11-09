class AddFieldsToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :street, :string, limit: 50
    add_column :addresses, :city, :string, limit: 50
    add_column :addresses, :city_code, :int
    add_column :addresses, :country, :string, limit: 50
  end
end
