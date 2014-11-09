class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.references :address, index: true

      t.timestamps
    end
  end
end
