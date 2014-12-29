module AnswersHelper

  def format_scale(answer, builder)
    percent = "#{(100/answer.scale.count).round}%"
    result = "<div style=\"width:100%\">"

    if answer.question.scale.scale_end - answer.question.scale.scale_start != 1
      answer.scale.each do |item|
        result += "<div style=\"width:#{percent};float:left;text-align:center;border:thin solid rgba(0,0,0,0)\">"
        result += item[:description].nil? ? "&nbsp;" : item[:description]
        result += "</div>"
      end
      result += '<div style="clear:both"></div>'
    end

    answer.scale.each do |item|
      result += "<div style=\"width:#{percent};float:left;text-align:center\">"
      result += builder.radio_button(:value, "#{item[:value]}")
      result += "&nbsp;"
      result += answer.question.scale.scale_end == 1 ? {"0" => "Nein", "1" => "Ja"}[item[:value].to_s] : "#{item[:value]+1}"
      result += "</div>"
    end
    result += '<div style="clear:both"></div>'
    result += "</div>"
    result.html_safe
  end

end
