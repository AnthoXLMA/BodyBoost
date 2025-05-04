class MealsController < ApplicationController
  before_action :require_login
  before_action :set_meal, only: [:edit, :update, :destroy]

  def index
        @meals = current_user.meals.includes(meal_items: :food).order(date: :desc)
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = current_user.meals.build(meal_params)
    if @meal.save
      redirect_to meals_path, notice: "Repas ajouté"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @meal.update(meal_params)
      redirect_to meals_path, notice: "Repas mis à jour"
    else
      render :edit
    end
  end

  def destroy
    @meal.destroy
    redirect_to meals_path, notice: "Repas supprimé"
  end

  private

  def set_meal
    @meal = current_user.meals.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(:name, :quantity, :calories, :proteins, :date)
  end
end
