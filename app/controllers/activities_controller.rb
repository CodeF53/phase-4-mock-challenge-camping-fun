class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :update, :destroy]

  # GET /activities
  def index
    @activities = Activity.all

    render json: @activities
  end

  # GET /activities/1
  def show
    render json: @activity
  end

  # POST /activities
  def create
    @activity = Activity.create!(activity_params)
    render json: @activity, status: :created, location: @activity
  end

  # PATCH/PUT /activities/1
  def update
    @activity.update!(activity_params)
    render json: @activity
  end

  # DELETE /activities/1
  def destroy
    @activity.destroy
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_activity
    @activity = Activity.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def activity_params
    params.permit(:name, :difficulty)
  end
end
