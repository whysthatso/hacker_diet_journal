class ServingsController < ApplicationController
  before_action :set_serving, only: %i[show edit update destroy]

  # GET /servings or /servings.json
  def index
    @servings = Serving.includes(:intake).all
    @servings_per_day = @servings.order(consumed_at: :desc).group_by { |serving| serving.consumed_at.strftime("%Y-%m-%d") }
  end

  # GET /servings/1 or /servings/1.json
  def show
  end

  # GET /servings/new
  def new
    @serving = Serving.new
    @common_intakes = Intake.with_common_portion
  end

  # GET /servings/1/edit
  def edit
  end

  # POST /servings or /servings.json
  def create
    @serving = Serving.new(serving_params)
    @intake = Intake.find_by id: serving_params[:intake_id]
    @serving.kcal = @intake.kcal_per_100 * @serving.amount / 100

    respond_to do |format|
      if @serving.save
        format.html { redirect_to servings_url, success: "Serving was successfully created." }
        format.json { render :show, status: :created, location: @serving }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @serving.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /servings/1 or /servings/1.json
  def update
    respond_to do |format|
      if @serving.update(serving_params)
        format.html { redirect_to serving_url(@serving), success: "Serving was successfully updated." }
        format.json { render :show, status: :ok, location: @serving }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @serving.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /servings/1 or /servings/1.json
  def destroy
    @serving.destroy

    respond_to do |format|
      format.html { redirect_to servings_url, success: "Serving was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_serving
    @serving = Serving.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def serving_params
    params.require(:serving).permit(:intake_id, :consumed_at, :kcal, :amount)
  end
end
