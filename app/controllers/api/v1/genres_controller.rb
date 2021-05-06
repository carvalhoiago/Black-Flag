class Api::V1::GenresController < ApplicationController
  def index
    genres = Genre.all
    render json: genres, status: :ok
  end

  def show
    if Genre.exists?(params[:id])
      genre = Genre.find(params[:id])
      render json:genre, status: :ok
    else
      render json: {status: 'error', message: 'not found'}, status: :not_found
    end
  end

  def destroy
    if Genre.exists?(params[:id])
      genre = Genre.find(params[:id])
      if genre.destroy!
        render json:{status: 'succes', message: 'genre destroyed' } , status: :ok
      else
        render json:{status: 'error', message: 'failed to destroy genre'}, status: :bad_request
      end
    else
      render json: {status: 'error', message: 'not found'}, status: :not_found
    end
  end

  def create
    genre = Genre.new(genre_params)
    if genre.save
      render json: genre, status: :created
    else
      render json: {status: 'error', message: 'genre not created'}, status: :unprocessable_entity
    end
  end

  def update
    if Genre.exists?(params[:id])
      genre = Genre.find(params[:id])
      if genre.update(genre_params)
        render json: genre, status: :ok
      end
    else
      render json: {status: 'error', message: 'not found'}, status: :not_found
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
