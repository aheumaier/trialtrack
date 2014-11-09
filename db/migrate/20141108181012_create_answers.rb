class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question, index: true
      t.references :user, index: true
      t.date :due_date
      t.date :answered_at
      t.integer :value
      t.string :value_text, limit: 255

      t.timestamps
    end
  end
end
