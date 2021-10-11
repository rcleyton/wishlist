class UsersController < ApplicationController

  # GET /users
  # List all users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/id
  # List user by id
  def show
    @user = User.find(params[:id])
    render json: @user, status: :ok
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

  # DELETE /users/id
  # Remove user
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: @user, status: :ok
  end

  private
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

end