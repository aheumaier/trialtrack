class AlterAddressable < ActiveRecord::Migration
  def change
		remove_column :organizations, :address_id	
		remove_column :users, :address_id
		add_column :addresses, :addressable_id, :integer
		add_column :addresses, :addressable_type, :string
  end
end
