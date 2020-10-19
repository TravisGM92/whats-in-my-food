class FoodsController < ApplicationController
  def show
    @foods = FoodsQuery.get_10_foods(params[:q])
  end
end
