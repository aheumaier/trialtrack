class CreateQuestionsTrials < ActiveRecord::Migration
  def self.up
    create_table :questions_trials do |t|
      t.references :question, index: true
      t.references :trial, index: true
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
