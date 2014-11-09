class CreateScales < ActiveRecord::Migration
  def change
    create_table :scales do |t|
      t.integer :scale_start
      t.integer :scale_end
      t.integer :value_no_answer

      t.timestamps
    end
  end
end
