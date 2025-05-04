class ActivitiesController < ApplicationController
  before_action :require_login
  before_action :set_activity, only: [:edit, :update, :destroy]

  def index
    @activities = current_user.activities.order(date: :desc)
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = current_user.activities.build(activity_params)
    if @activity.save
      redirect_to activities_path, notice: "Activité ajoutée"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @activity.update(activity_params)
      redirect_to activities_path, notice: "Activité mise à jour"
    else
      render :edit
    end
  end

  def destroy
    @activity.destroy
    redirect_to activities_path, notice: "Activité supprimée"
  end

  private

  def set_activity
    @activity = current_user.activities.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:name, :duration, :calories, :date)
  end
end
