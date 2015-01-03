class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_answer, only: [:show, :edit, :destroy]

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def answer

    errors = []

    Answer.transaction do
      params.permit!
      params[:answers].each do |id, a|
        @answer = Answer.find(id)
        Rails.logger.debug @answer.inspect
        unless @answer.update!(a)
          Rails.logger.debug @answer.inspect
          errors << @answer.errors
        end
      end
    end

    respond_to do |format|
      if errors.empty?
        format.html { redirect_to '/dashboard/teilnehmer', notice: 'Answer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer

      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:id, :question_id, :user_id, :due_date, :answered_at, :value, :value_text)
    end
end
