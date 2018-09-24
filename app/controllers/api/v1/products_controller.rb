module Api
  module V1
    class ProductsController < ApplicationController
      before_action :set_product, only: [:show, :update, :destroy]

      # GET /products
      def index
        products = Product.order('updated_at DESC')

        render json: { status: :ok, message: 'Loaded all products', data: products }
      end

      # GET /products/1
      def show
        render json: { status: :ok, message: 'Loaded products', data: set_product }
      end

      # POST /products
      def create
        product = Product.new(product_params)

        if product.save
          render json: { status: :created, message: 'Created product', data: product }
        else
          render json: product.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /products/1
      def update
        if set_product.update(product_params)
          render json: { status: :ok, message: 'Product updated', data: set_product }
        else
          render json: set_product.errors, status: :unprocessable_entity
        end
      end

      # DELETE /products/1
      def destroy
        set_product.destroy

        render json: { status: :ok, message: 'Product deleted', data: set_product }
      end

      private

      # @return [Product] - Find and set the current product via ID
      def set_product
        Product.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def product_params
        params.permit(:name, :price, :shop)
      end
    end
  end
end
