class FavoritesController < ApplicationController
  before_action :authorize_request
  before_action :get_product

  def show 
    @favorite = Favorite.find(params[:id])
    render json: @favorite
  end

  def create
    if @current_user.favorite.present?
      @current_user.favorite.product_id << get_product
      if @current_user.favorite.save
        render json: @current_user.favorite.product_id
      end
    else
      @favorite = Favorite.create(user_id: @current_user.id,
                                  product_id: [get_product])
      if @favorite.save
        render json: @favorite
      end
    end
  end

  private

  def get_product
    url = 'http://challenge-api.luizalabs.com/api/product/'
    product_id = HTTParty.get("#{url}#{params[:product_id]}/")
    product_id.body
  end

end