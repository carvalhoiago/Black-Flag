class Api::V1::UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def show
    if User.exists?(params[:id])
      user = User.find(params[:id])
      render json: user, status: :ok
    else
      render json: {status: 'error', message: 'not found'}, status: :not_found
    end
  end

  def destroy
    if User.exists?(params[:id])
      user = User.find(params[:id])
      if user.destroy!
        render json:{status: 'succes', message: 'user destroyed' } , status: :ok
      else
        render json:{status: 'error', message: 'failed to destroy user'}, status: :bad_request
      end
    else
      render json: {status: 'error', message: 'not found'}, status: :not_found
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: {status: 'error', message: 'user not created'}, status: :unprocessable_entity
    end
  end

  def update
    if User.exists?(params[:id])
      user = User.find(params[:id])
      if user.update(user_params)
        render json: user, status: :ok
      end
    else
      render json: {status: 'error', message: 'not found'}, status: :not_found
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
