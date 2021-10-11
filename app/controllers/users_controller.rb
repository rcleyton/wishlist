class UsersController < ApplicationController

  # GET /users
  # Lista all users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # POST /users
  # Create a new user
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :ok
    else  
      render json: { errors: @user.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  # PUT /users/id
  # Update user
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user, status: :ok
    else  
      render json: { errors: @user.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

end