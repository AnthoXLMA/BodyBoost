class FoodsController < ApplicationController
  def index
    @categories = Category.includes(:foods).order(:name)
  end
end
