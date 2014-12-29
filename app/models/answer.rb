class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  def scale
    values = {}
    (self.question.scale.scale_start..self.question.scale.scale_end).to_a.each do |i|
      values[i] = {:value => i, :description => ""}
    end
    self.question.scale.scalevalues.load.each do |sv|
      values[sv.value][:description] = sv.description
    end

    values.flatten.select{|v| v.class != Fixnum}
  end

end
