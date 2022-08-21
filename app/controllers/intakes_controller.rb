class IntakesController < ApplicationController
  before_action :set_intake, only: %i[show edit update destroy]

  # GET /intakes or /intakes.json
  def index
    @intakes = Intake.all
  end

  # GET /intakes/1 or /intakes/1.json
  def show
  end

  # GET /intakes/new
  def new
    @intake = Intake.new
  end

  # GET /intakes/1/edit
  def edit
  end

  # POST /intakes or /intakes.json
  def create
    @intake = Intake.new(intake_params)

    respond_to do |format|
      if @intake.save
        format.html { redirect_to intake_url(@intake), success: "Intake was successfully created." }
        format.json { render :show, status: :created, location: @intake }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intake.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intakes/1 or /intakes/1.json
  def update
    respond_to do |format|
      if @intake.update(intake_params)
        format.html { redirect_to intake_url(@intake), success: "Intake was successfully updated." }
        format.json { render :show, status: :ok, location: @intake }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intake.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intakes/1 or /intakes/1.json
  def destroy
    @intake.destroy

    respond_to do |format|
      format.html { redirect_to intakes_url, success: "Intake was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_intake
    @intake = Intake.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def intake_params
    params.require(:intake).permit(:description, :ean, :kcal_per_100)
  end
end
