class CreateJoinTableTrialQuestion < ActiveRecord::Migration
  def change
    create_join_table :trials, :questions do |t|
      t.index [:trial_id, :question_id]
      t.index [:question_id, :trial_id]
      t.timestamps
    end
  end
end
