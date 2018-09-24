module Api
  module V1
    class OrdersController < ApplicationController
      before_action :set_order, only: [:show, :update, :destroy]

      # GET /orders
      def index
        orders = Order.order('updated_at DESC')

        render json: { status: :ok, message: 'Loaded all orders', data: orders }
      end

      # GET /orders/1
      def show
        render json: { status: :ok, message: 'Loaded orders', data: set_order }
      end

      # POST /orders
      def create
        order = Order.new(order_params)

        if order.save
          render json: { status: :created, message: 'Created order', data: order }
        else
          render json: order.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /orders/1
      def update
        if set_order.update(order_params)
          render json: { status: :ok, message: 'Order updated', data: set_order }
        else
          render json: set_order.errors, status: :unprocessable_entity
        end
      end

      # DELETE /orders/1
      def destroy
        set_order.destroy

        render json: { status: :ok, message: 'Order deleted', data: set_order }
      end

      private

      # @return [Order] - Find and set the current order via ID
      def set_order
        Order.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def order_params
        params.permit(:shop)
      end
    end
  end
end
