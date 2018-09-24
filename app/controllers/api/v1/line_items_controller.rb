module Api
  module V1
    class LineItemsController < ApplicationController
      before_action :set_line_item, only: [:show, :update, :destroy]

      # GET /line_items
      def index
        line_items = LineItems.order('updated_at DESC')

        render json: { status: :ok, message: 'Loaded all line items', data: line_items }
      end

      # GET /line_items/1
      def show
        render json: { status: :ok, message: 'Loaded line items', data: set_line_item }
      end

      # POST /line_items
      def create
        line_item = LineItem.new(line_item_params)

        if line_item.save
          render json: { status: :created, message: 'Created line item', data: line_item }
        else
          render json: line_item.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /line_items/1
      def update
        if set_line_item.update(line_item_params)
          render json: { status: :ok, message: 'Line item updated', data: set_line_item }
        else
          render json: set_line_item.errors, status: :unprocessable_entity
        end
      end

      # DELETE /line_items/1
      def destroy
        set_line_item.destroy

        render json: { status: :ok, message: 'Line Item deleted', data: set_line_item }
      end

      private

      # @return [LineItem] - Find and set the current line item via ID
      def set_line_item
        LineItem.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def line_item_params
        params.permit(:product, :order, :quantity)
      end
    end
  end
end
