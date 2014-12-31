class TrialsUsersController < ApplicationController
  before_action :set_trials_user, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /trials_users
  # GET /trials_users.json
  def index
    @trials_users = TrialsUser.accessible_by(current_ability)
  end

  # GET /trials_users/1
  # GET /trials_users/1.json
  def show
  end

  # GET /trials_users/new
  def new
    @trials_user = TrialsUser.new
    @users = User.all.load
    @trials = Trial.accessible_by(current_ability) #.order('created_at DESC')
  end

  # GET /trials_users/1/edit
  def edit
    @users = User.all
    @trials = Trial.accessible_by(current_ability)
  end

  # POST /trials_users
  # POST /trials_users.json
  def create
    @trials_user = TrialsUser.new(trials_user_params)

    respond_to do |format|
      if @trials_user.save
        format.html { redirect_to @trials_user, notice: 'Trials user was successfully created.' }
        format.json { render action: 'show', status: :created, location: @trials_user }
      else
        format.html { render action: 'new' }
        format.json { render json: @trials_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trials_users/1
  # PATCH/PUT /trials_users/1.json
  def update
    respond_to do |format|
      if @trials_user.update(trials_user_params)
        format.html { redirect_to @trials_user, notice: 'Trials user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @trials_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trials_users/1
  # DELETE /trials_users/1.json
  def destroy
    @trials_user.destroy
    respond_to do |format|
      format.html { redirect_to trials_users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trials_user
      @trials_user = TrialsUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trials_user_params
      params.require(:trials_user).permit(:id, :user_id, :trial_id, :start_date, :end_date )
    end
end
