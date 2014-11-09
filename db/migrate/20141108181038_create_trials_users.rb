class CreateTrialsUsers < ActiveRecord::Migration
  def change
    create_table :trials_users do |t|
      t.references :user, index: true
      t.references :trial, index: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
