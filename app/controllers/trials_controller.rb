class TrialsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_trial, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /trials
  # GET /trials.json
  def index
    @trials = Trial.accessible_by(current_ability).includes(:organization)
  end

  # GET /trials/1
  # GET /trials/1.json
  def show
  end

  # GET /trials/new
  def new
    @trial = Trial.new
    @questions = Question.all.load
    @my_questions = @trial.questions.all.load
    @organizations = Organization.accessible_by(current_ability).load
  end

  # GET /trials/1/edit
  def edit
    @organizations = Organization.accessible_by(current_ability)
    @my_questions = @trial.questions.all.load
    @questions = Question.where(["id NOT in (?)", @my_questions.ids.empty? ? -1 : @my_questions.ids])
  end

  # POST /trials
  # POST /trials.json
  def create
    @trial = Trial.new(trial_params)

    respond_to do |format|
      if @trial.save
        format.html { redirect_to @trial, notice: 'Trial was successfully created.' }
        format.json { render action: 'show', status: :created, location: @trial }
      else
        format.html { render action: 'new' }
        format.json { render json: @trial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trials/1
  # PATCH/PUT /trials/1.json
  def update
    p = trial_params.clone
    if p["question_ids"].nil?
      p["question_ids"] = []
    end

    respond_to do |format|
      if @trial.update(p)
        format.html { redirect_to @trial, notice: 'Trial was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @trial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trials/1
  # DELETE /trials/1.json
  def destroy
    @trial.destroy
    respond_to do |format|
      format.html { redirect_to trials_url }
      format.json { head :no_content }
    end
  end

  def assign_question
    question_trial = QuestionsTrial.new({:question_id => params[:question_id], :trial_id => params[:trial_id]})
    if question_trial.save
      @question = question_trial.question
    end
  end


  def remove_question
    question_trial = QuestionsTrial.where({:question_id => params[:question_id], :trial_id => params[:id]}).first
    unless question_trial.nil?
      question_trial.destroy
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trial
      @trial = Trial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trial_params
      params.require(:trial).permit(:id, :name, :description, :summary, :organization_id, :question_id,{ :question_ids => []})
    end
end
