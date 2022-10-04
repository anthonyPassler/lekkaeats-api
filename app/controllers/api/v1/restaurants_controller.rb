class Api::V1::RestaurantsController < ApplicationController
  def index
    @restaurants = policy_scope(Restaurant)

    render json: @restaurants.to_json(only: %i[id name])
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant

    render json: @restaurant.to_json(only: %i[id name])
  end
end
