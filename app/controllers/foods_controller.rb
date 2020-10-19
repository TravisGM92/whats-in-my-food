class FoodsController < ApplicationController
  def show
    @foods = FoodsQuery.get_foods(params[:q])
  end
end
