class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :question_type, index: true
      t.string :question, limit: 255
      t.integer :interval
      t.references :scale, index: true

      t.timestamps
    end
  end
end
