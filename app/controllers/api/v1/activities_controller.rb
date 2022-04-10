class Api::V1::ActivitiesController < Api::V1::ApiController
  def index
    @activities = Activity.all

    render json: @activities.map { |activity|
      activity.as_json.merge({ name: activity.name, description: activity.description,
        date: activity.date, activityFileUrl: url_for(activity.activityFile), activityFile_blob: activity.activityFile_blob })
    }
  end

  def show
    @activity = Activity.find(params[:id])

    render json: @activity.as_json.merge({ name: @activity.name, description: @activity.description,
      date: @activity.date, activityFile: url_for(@activity.activityFile), activityFile_blob: @activity.activityFile_blob })
  end

  def create
    activity = Activity.new(name: params[:name], description: params[:description], date: params[:date], activityFile: params[:activityFile])

    if activity.save
      render json: activity, status: 201
    else
      render status: 422, json: activity.errors.full_messages
    end
  end
end
