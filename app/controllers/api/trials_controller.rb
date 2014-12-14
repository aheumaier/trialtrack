module Api
  class TrialsController < Api::BaseController


    private

    def trial_params
      params.require(:trial).permit(:id, :name, :description, :summary, :organization_id, :question_id,{ :question_ids => []})
    end

    def query_params
      # this assumes that an album belongs to an artist and has an :question_id
      # allowing us to filter by this
      params.permit(:id, :name, :description, :summary, :organization_id, :question_id,{ :question_ids => []})
    end

  end
end
