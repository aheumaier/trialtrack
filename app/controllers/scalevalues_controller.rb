class ScalevaluesController < ApplicationController
  before_action :set_scalevalue, only: [:show, :edit, :update, :destroy]

  # GET /scalevalues
  # GET /scalevalues.json
  def index
    @scalevalues = Scalevalue.all
  end

  # GET /scalevalues/1
  # GET /scalevalues/1.json
  def show
  end

  # GET /scalevalues/new
  def new
    @scalevalue = Scalevalue.new
  end

  # GET /scalevalues/1/edit
  def edit
  end

  # POST /scalevalues
  # POST /scalevalues.json
  def create
    @scalevalue = Scalevalue.new(scalevalue_params)

    respond_to do |format|
      if @scalevalue.save
        format.html { redirect_to @scalevalue, notice: 'Scalevalue was successfully created.' }
        format.json { render action: 'show', status: :created, location: @scalevalue }
      else
        format.html { render action: 'new' }
        format.json { render json: @scalevalue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scalevalues/1
  # PATCH/PUT /scalevalues/1.json
  def update
    respond_to do |format|
      if @scalevalue.update(scalevalue_params)
        format.html { redirect_to @scalevalue, notice: 'Scalevalue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @scalevalue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scalevalues/1
  # DELETE /scalevalues/1.json
  def destroy
    @scalevalue.destroy
    respond_to do |format|
      format.html { redirect_to scalevalues_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scalevalue
      @scalevalue = Scalevalue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scalevalue_params
      params.require(:scalevalue).permit(:id, :value, :description)
    end
end
