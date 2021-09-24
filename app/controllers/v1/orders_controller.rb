# Orders Controller
class V1::OrdersController < ApplicationController
  def index
    @orders = Order.api_json

    render json: @orders, status: 200
  end

  def show
    @order = Order.find_by(params[:id])
    if @order
      render json: @order, status: 200
    else
      render json: @order.errors.full_messages, status: :error
    end
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      render json: @order.api_json, status: :created
    else
      render json: @order.errors.full_messages, status: :error
    end
  end

  def update
    @order = Order.find_by(id: params[:id])
    if @order.update(order_params)
      render json: @order, status: :ok
    else
      render json: @order, status: :error
    end
  end

  def destroy
    @order = Order.find_by(id: params[:id])
    if @order.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  private

  def order_params
    params.require(:order).permit(:store_id, product_ids: [])
  end
end
