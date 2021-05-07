class Api::V1::GamesController < ApplicationController
  acts_as_token_authentication_handler_for User, only: %i[create]
  def index
    games = Game.all
    render json: games, status: :ok
  end

  def show
    if Game.exists?(params[:id])
      game = Game.find(params[:id])
      render json: game, status: :ok
    else
      render json: {status: 'error', message: 'not found'}, status: :not_found
    end
  end

  def destroy
    if Game.exists?(params[:id])
      game = Game.find(params[:id])
      if game.destroy!
        render json:{status: 'succes', message: 'game destroyed' } , status: :ok
      else
        render json:{status: 'error', message: 'failed to destroy game'}, status: :bad_request
      end
    else
      render json: {status: 'error', message: 'not found'}, status: :not_found
    end
  end

  def create
    game = Game.new(game_params)
    if game.save
      render json: game, status: :created
    else
      render json: {status: 'error', message: 'game not created'}, status: :unprocessable_entity
    end
  end

  def update
    if Game.exists?(params[:id])
      game = Game.find(params[:id])
      if game.update(game_params)
        render json: game, status: :ok
      end
    else
      render json: {status: 'error', message: 'not found'}, status: :not_found
    end
  end

  private
  def game_params
    params.require(:game).permit(:name, :price, :publisher_id, :description, :trailer)
  end
end
