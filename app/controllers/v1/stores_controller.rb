class V1::StoresController < ApplicationController
  def index
    @stores = Store.all

    render json: @stores, status: 200
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      render json: @store, status: :created
    else
      render json: @store.errors.full_messages, status: :error
    end
  end

  def update
    @store = Store.find_by(id: params[:id])
    if @store.update(store_params)
      render json: @store, status: :ok
    else
      render json: @store, status: :error
    end
  end

  def destroy
    @store = Store.find_by(id: params[:id])
    if @store.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  private
  def store_params
    params.require(:store).permit(:name, :address, :email, :phone)
  end
end