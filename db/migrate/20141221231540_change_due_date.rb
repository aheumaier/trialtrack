class ChangeDueDate < ActiveRecord::Migration
  def change
    change_column :answers, :due_date, :datetime, :null => false
  end
end
