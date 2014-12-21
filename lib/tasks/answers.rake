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

				

			end

		end



	end

end
