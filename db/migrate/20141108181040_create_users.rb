class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, limit: 255
      t.string :last_name, limit: 255
      t.references :role, index: true
      t.references :address, index: true
      t.references :organization, index: true

      t.timestamps
    end
  end
end
