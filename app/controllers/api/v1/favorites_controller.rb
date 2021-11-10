module Api
  module V1
    class FavoritesController < ApplicationController
      before_action :authorize_request
      before_action :user_list

      include Request

      def show 
        @favorite = Favorite.find(params[:id])
        render json: @favorite, status: :ok
      end

      def create
        if get_product == 404
          render json: { error: "Product not found" }, status: :not_found

        elsif @user_list.present? 
          check_id = product_present(@user_list.product)

          if check_id.include?(true)
            render json: { status: "Product is already added to wishlist" }
          else
            @user_list.product << get_product
            @user_list.save
            render json: { success: "Product added to wishlist" }, status: :created
          end

        elsif @user_list.nil?
          @favorite = Favorite.create(user_id: @current_user.id,
                                      product: [get_product])
          @favorite.save
          render json: { success: "Product added to wishlist" }, status: :created
        end
      end

      private
      def user_list
        @user_list = @current_user.favorite
      end

      def product_present(product)
        product.map do |prod|
          JSON.parse(prod).has_value?(params[:product_id])
        end
      end

    end
  end
end