class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def new
    @activities = Activity.new
  end

  def show
    @activities = Activity.find(params[:id])
  end

  def create
    activity_params = params.require(:activity).permit(:name, :description, :date)
    @activity = Category.new(activity_params)
    return redirect_to @category if @activity.save

    render :new
  end
end
