class Api::V1::ActivitiesController < Api::V1::ApiController
  def index
    activities = Activity.all
    render json: activities.as_json(except: %i[created_at updated_at]), status: 200
  end

  def show
    activity = Activity.find(params[:id])
    render json: activity.as_json(except: %i[created_at updated_at]), status: 200
  end

  def create
    activity = Activity.new(name: params[:name], description: params[:description], date: params[:date], file: params[:file])

    if activity.save
      render json: activity, status: 201
    else
      render status: 422, json: activity.errors.full_messages
    end
  end
end
