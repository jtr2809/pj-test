class V1::ProductsController < ApplicationController
  def index
    @products = Product.all

    render json: @products, status: 200
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors.full_messages, status: :error
    end
  end

  def update
    @product = product.find_by(id: params[:id])
    if @product.update(product_params)
      render json: @product, status: :ok
    else
      render json: @product, status: :error
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    if @product.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  private
  def product_params
    params.require(:contact).permit(:name, :sku, :type, :price)
  end
end