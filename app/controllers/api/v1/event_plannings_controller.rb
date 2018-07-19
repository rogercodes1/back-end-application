class Api::V1::EventPlanningsController < ApplicationController
  # before_action :requires_login, only: [:index]

  def index
    byebug
    @event_plannings = EventPlanning.all
    render json: @event_plannings
  end

  def create
    byebug
    @event_planning = EventPlanning.new(get_params)

    if (@event_planning.save)

     render json: @event_planning
    else
      render json: {error: "Events, something went wrong!"}
    end
  end

  def show
    byebug
    render json: EventPlanning.find(params[:user_id])
  end

  def update
    byebug
    @event_planning = EventPlanning.find(params[:id])

    if @event_planning.update(get_params)
      render json: @event_planning
    else
      render json: {error: "Event update, something went wrong!"}
    end
  end

  def destroy
    @event_planning = EventPlanning.find(params[:id])
    @event_planning.destroy
    render json: {message: "Event, Successful Deletion"}
  end

  private

  def get_params
    params.require(:event_planning).permit(:date, :name, :current_savings, :goal_amount, :amount_needed, :user_id)
  end
end
