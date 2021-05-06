class Api::V1::PublishersController < ApplicationController
  def index
    publishers = Publisher.all
    render json: publishers, status: :ok
  end

  def show
    if Publisher.exists?(params[:id])
      publisher = Publisher.find(params[:id])
      render json:publisher, status: :ok
    else
      render json: {status: 'error', message: 'not found'}, status: :not_found
    end
  end

  def destroy
    if Publisher.exists?(params[:id])
      publisher = Publisher.find(params[:id])
      if publisher.destroy!
        render json:{status: 'succes', message: 'publisher destroyed' } , status: :ok
      else
        render json:{status: 'error', message: 'failed to destroy publisher'}, status: :bad_request
      end
    else
      render json: {status: 'error', message: 'not found'}, status: :not_found
    end
  end

  def create
    publisher = Publisher.new(publisher_params)
    if publisher.save
      render json: publisher, status: :created
    else
      render json: {status: 'error', message: 'publisher not created'}, status: :unprocessable_entity
    end
  end

  def update
    if Publisher.exists?(params[:id])
      publisher = Publisher.find(params[:id])
      if publisher.update(publisher_params)
        render json: publisher, status: :ok
      end
    else
      render json: {status: 'error', message: 'not found'}, status: :not_found
    end
  end

  private
  def publisher_params
    params.require(:publisher).permit(:name)
  end
end
