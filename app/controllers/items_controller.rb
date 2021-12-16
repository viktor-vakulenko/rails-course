class ItemsController < ApplicationController
  layout false
  skip_before_action :verify_authenticity_token
  def index
    @items = Item.all
    render text: @items.map do |item|
      "#{item.name}:#{item.amount}:"
    end
  end

  def create
    item = Item.create(items_params)
    if item.persisted?
      # render body: 'Hello, world'
      render json: item.name, status: :created
    else
      render json: item.errors, status: :unprocessable_entity
    end
  end

  private

  def items_params
    params.permit(:name, :amount, :real, :description, :weight)
  end
end
