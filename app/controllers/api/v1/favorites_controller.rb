module Api
  module V1
    class FavoritesController < ApplicationController
      before_action :authorize_request

      def show 
        @favorite = Favorite.find(params[:id])
        render json: @favorite, status: :ok
      end

      def create
        if product.code == 404
          render json: { error: "Product not found" }, status: :not_found

        elsif @current_user.favorite.present? 
          check_id = product_present(@current_user.favorite.product)

          if check_id.include?(true)
            render json: { status: "Product is already added to wishlist" }
          else
            @current_user.favorite.product << product.body
            @current_user.favorite.save
            render json: { success: "Product added to wishlist" }, status: :created
          end

        elsif @current_user.favorite.nil?
          @favorite = Favorite.create(user_id: @current_user.id, product: [product])
          @favorite.save
          render json: { success: "Product added to wishlist" }, status: :created
        end
      end

      private
      def product
        HTTParty.get("#{ENV['URI_BASE']}#{params[:product_id]}/")
      end 

      def product_present(product)
        product.map do |prod|
          JSON.parse(prod).has_value?(params[:product_id])
        end
      end

    end
  end
end