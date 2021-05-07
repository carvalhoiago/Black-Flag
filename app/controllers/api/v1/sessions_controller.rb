class Api::V1::SessionsController < ApplicationController
  def sign_in
    user = User.find_by(email: params[:email])
    if user.nil?
      render json: {message: "email nao cadastrado"}, status: :unauthorized
    elsif  user.valid_password?(params[:password])
      render json: user.as_json(only: %i[name email authentication_token])
    else
      head( :unauthorized)
    end
  end
end
