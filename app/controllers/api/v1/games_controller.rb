class Api::V1::GamesController < ApplicationController

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
    print("Retornei                ")
    print (game.name)
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
    print ("OLAAAAAAAAAAAAAAAAA")
    print (params[:publisher])
    publisher_name = params[:publisher]
    print (publisher_name.nil?)
    g_params = params.require(:game).permit(:name, :trailer, :description, :price)
    print("OIIIIIIIIIIIIIIIIii         ")
    print (g_params)
    if not publisher_name.nil?
       publisher = Publisher.find_by name: publisher_name
       print(publisher)
      if not publisher.nil?
       g_params[:publisher_id => publisher.id]
      else
        print ("PUBLICADORA N EXISTE")
      publisher = Publisher.create(name: publisher_name)
        g_params[:publisher_id => publisher.id]
      end
    end
    print("DEPOIS DE TUDO:       ")
    print (g_params)
    return g_params
  end
end
