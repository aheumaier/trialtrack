class ScalesScalevaluesController < ApplicationController
  before_action :set_scales_scalevalue, only: [:show, :edit, :update, :destroy]

  # GET /scales_scalevalues
  # GET /scales_scalevalues.json
  def index
    @scales_scalevalues = ScalesScalevalue.all
  end

  # GET /scales_scalevalues/1
  # GET /scales_scalevalues/1.json
  def show
  end

  # GET /scales_scalevalues/new
  def new
    @scales_scalevalue = ScalesScalevalue.new
  end

  # GET /scales_scalevalues/1/edit
  def edit
  end

  # POST /scales_scalevalues
  # POST /scales_scalevalues.json
  def create
    @scales_scalevalue = ScalesScalevalue.new(scales_scalevalue_params)

    respond_to do |format|
      if @scales_scalevalue.save
        format.html { redirect_to @scales_scalevalue, notice: 'Scales scalevalue was successfully created.' }
        format.json { render action: 'show', status: :created, location: @scales_scalevalue }
      else
        format.html { render action: 'new' }
        format.json { render json: @scales_scalevalue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scales_scalevalues/1
  # PATCH/PUT /scales_scalevalues/1.json
  def update
    respond_to do |format|
      if @scales_scalevalue.update(scales_scalevalue_params)
        format.html { redirect_to @scales_scalevalue, notice: 'Scales scalevalue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @scales_scalevalue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scales_scalevalues/1
  # DELETE /scales_scalevalues/1.json
  def destroy
    @scales_scalevalue.destroy
    respond_to do |format|
      format.html { redirect_to scales_scalevalues_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scales_scalevalue
      @scales_scalevalue = ScalesScalevalue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scales_scalevalue_params
      params.require(:scales_scalevalue).permit(:id, :scalevalues_id, :scale_id)
    end
end
