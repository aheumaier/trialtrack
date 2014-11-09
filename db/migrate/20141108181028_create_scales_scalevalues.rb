class CreateScalesScalevalues < ActiveRecord::Migration
  def change
    create_table :scales_scalevalues do |t|
      t.references :scalevalues, index: true
      t.references :scale, index: true

      t.timestamps
    end
  end
end
