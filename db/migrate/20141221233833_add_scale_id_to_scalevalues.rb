class AddScaleIdToScalevalues < ActiveRecord::Migration
  def change
    add_reference :scalevalues, :scale, index: true
  end
end
