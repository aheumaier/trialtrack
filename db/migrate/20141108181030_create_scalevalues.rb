class CreateScalevalues < ActiveRecord::Migration
  def change
    create_table :scalevalues do |t|
      t.integer :value
      t.string :description, limit: 50

      t.timestamps
    end
  end
end
