namespace :answers do
 	desc "TODO"
	task :schedule, [:reschedule] => :environment do |t, args|

		logger = Logger.new(STDOUT)

		reschedule = args[:reschedule]
		reschedule = reschedule.class == String ? (reschedule.match(/(yes|true)/)) : reschedule.to_i == 1

		if reschedule
			logger.debug "Re-scheduling" 
		end

		TrialsUser.where(["start_date <= NOW() AND end_date >= NOW()"]).all.each do |tu|  
			user = tu.user
			trial = tu.trial

			trial.questions.each do |question|
        question_trial = QuestionsTrial.where(:question_id => question.id, :trial_id => trial.id).first
        duration = ((question_trial.end_time - question_trial.start_time) / 3600).ceil
        #TODO: Testen!!!
        qstart = (question_trial.start_time.seconds_since_midnight / 3600).ceil
        qend = (question_trial.end_time.seconds_since_midnight / 3600).ceil
        count = (duration/question.interval).to_i
        logger.debug "Interval #{question.interval}, start #{qstart}, end #{qend}, duration #{duration}, count #{count}"
        (0..count-1).each do |i|
          due_date = (Time.now-Time.now.seconds_since_midnight) + qstart * 3600  + (i+1) * (duration/count * 3600)
          logger.debug "Scheduling '#{question.question}' for #{user.first_name} #{user.last_name} to be answered by #{due_date}"
          Answer.create({question_id: question.id, user_id: user.id, due_date: due_date, answered_at: nil})
        end

			end

		end



	end

end
