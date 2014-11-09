class CreateTrialsQuestions < ActiveRecord::Migration
  def change
    create_table :trials_questions do |t|
      t.references :question, index: true
      t.references :trial, index: true

      t.timestamps
    end
  end
end
