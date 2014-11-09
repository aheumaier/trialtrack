class TrialsQuestionsController < ApplicationController
  before_action :set_trials_question, only: [:show, :edit, :update, :destroy]

  # GET /trials_questions
  # GET /trials_questions.json
  def index
    @trials_questions = TrialsQuestion.all
  end

  # GET /trials_questions/1
  # GET /trials_questions/1.json
  def show
  end

  # GET /trials_questions/new
  def new
    @trials_question = TrialsQuestion.new
  end

  # GET /trials_questions/1/edit
  def edit
  end

  # POST /trials_questions
  # POST /trials_questions.json
  def create
    @trials_question = TrialsQuestion.new(trials_question_params)

    respond_to do |format|
      if @trials_question.save
        format.html { redirect_to @trials_question, notice: 'Trials question was successfully created.' }
        format.json { render action: 'show', status: :created, location: @trials_question }
      else
        format.html { render action: 'new' }
        format.json { render json: @trials_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trials_questions/1
  # PATCH/PUT /trials_questions/1.json
  def update
    respond_to do |format|
      if @trials_question.update(trials_question_params)
        format.html { redirect_to @trials_question, notice: 'Trials question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @trials_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trials_questions/1
  # DELETE /trials_questions/1.json
  def destroy
    @trials_question.destroy
    respond_to do |format|
      format.html { redirect_to trials_questions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trials_question
      @trials_question = TrialsQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trials_question_params
      params.require(:trials_question).permit(:id, :question_id, :trial_id)
    end
end
