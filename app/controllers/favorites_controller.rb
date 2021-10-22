class FavoritesController < ApplicationController
  before_action :authorize_request

  include Request

  def show 
    @favorite = Favorite.find(params[:id])
    render json: @favorite, status: :ok
  end

  def create    
    if get_product == 404
      render json: { error: "Product not found" }, status: :not_found
    else  
      if @current_user.favorite.present?
        @current_user.favorite.product_id << get_product
        @current_user.favorite.save
      else
        @favorite = Favorite.create(user_id: @current_user.id,
                                    product_id: [get_product])
        @favorite.save
      end

      render json: { error: "Product added to wishlist" }, status: :ok
    end
    
  end

end