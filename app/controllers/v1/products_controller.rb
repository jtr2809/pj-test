# Products Controller
class V1::ProductsController < ApplicationController
  def index
    @products = Product.all

    render json: @products, status: 200
  end

  def show
    @product = Product.find_by(id: params[:id])
    if @product
      render json: @product, status: 200
    else
      render json: @product.errors.full_messages, status: :error
    end
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
    @product = Product.find_by(id: params[:id])
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
    params.require(:product).permit(:name, :sku, :type, :price)
  end
end
