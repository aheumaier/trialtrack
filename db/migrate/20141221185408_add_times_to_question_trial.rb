class AddTimesToQuestionTrial < ActiveRecord::Migration
  def change
    add_column :questions_trials, :start_time, :datetime
    add_column :questions_trials, :end_time, :datetime
  end
end
