class CreateTrials < ActiveRecord::Migration
  def change
    create_table :trials do |t|
      t.string :name, limit: 255
      t.text :description
      t.string :summary, limit: 255

      t.timestamps
    end
  end
end
