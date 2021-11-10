module Api
  module V1
    class UsersController < ApplicationController
      before_action :authorize_request, except: :create
      
      def show
        @user = User.find(params[:id])
        if @current_user == @user
          render json: @user, status: :ok
        else  
          render json: { error: 'Unauthorized' }, status: :unauthorized
        end
      end

      def create
        @user = User.new(user_params)
        if @user.save
          render json: @user, status: :created
        else  
          render json: { errors: @user.errors.full_messages },
            status: :unprocessable_entity
        end
      end

      def update
        @user = User.find(params[:id])
        if @current_user == @user
          if @user.update!(user_params)
            render json: @user, status: :ok
          else  
            render json: { errors: @user.errors.full_messages },
              status: :unprocessable_entity
          end 
        else  
          render json: { error: 'Unauthorized' }, status: :unauthorized
        end
      end

      def destroy
        @user = User.find(params[:id])
        if @current_user == @user
          @user.destroy
          render json: @user, status: :ok
        else  
          render json: { error: 'Unauthorized' }, status: :unauthorized
        end
      end

      private
      def user_params
        params.permit(:name, :email, :password, :password_confirmation)
      end

    end
  end
end