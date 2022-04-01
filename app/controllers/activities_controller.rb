class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def new
    @activities = Activity.new
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def create
    activity_params = params.require(:activity).permit(:name, :description, :date, :file)
    @activity = Activity.new(activity_params)
    return redirect_to @activity if @activity.save

    render :new
  end
end
