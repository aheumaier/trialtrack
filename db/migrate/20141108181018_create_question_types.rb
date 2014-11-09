class CreateQuestionTypes < ActiveRecord::Migration
  def change
    create_table :question_types do |t|
      t.string :name, limit: 255

      t.timestamps
    end
  end
end
