module Api
  module V1
    class ShopsController < ApplicationController
      before_action :set_shop, only: [:show, :update, :destroy]

      # GET /shops
      def index
        shops = Shop.order('updated_at DESC')

        render json: { status: :ok, message: 'Loaded all shops', data: shops }
      end

      # GET /shops/1
      def show
        render json: { status: :ok, message: 'Loaded shop', data: set_shop }
      end

      # POST /shops
      def create
        shop = Shop.new(shop_params)

        if shop.save
          render json: { status: :created, message: 'Created shop', data: shop }
        else
          render json: shop.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /shops/1
      def update
        if set_shop.update(shop_params)
          render json: { status: :ok, message: 'Shop updated', data: set_shop }
        else
          render json: set_shop.errors, status: :unprocessable_entity
        end
      end

      # DELETE /shops/1
      def destroy
        set_shop.destroy

        render json: { status: :ok, message: 'Shop deleted' }
      end

      private

      # @return [Shop] - Find and set the current shop via ID
      def set_shop
        Shop.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def shop_params
        params.permit(:name)
      end
    end
  end
end
