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
      redirect_to items_path
    else
      render json: item.errors, status: :unprocessable_entity
    end
  end

  def new; end

  def edit
    render body: 'Error 404', status: 404 unless (@item = Item.where(id: params[:id]).first)
    @item = Item.where(id: params[:id]).first
  end

  def show
    render body: 'Error 404' unless (@item = Item.where(id: params[:id]).first)
    @item = Item.where(id: params[:id]).first
    # if @item
    #   render 'items/show'
    # else
    #   render body: "Error 404"
    # end
  end

  def update
    item = Item.where(id: params[:id]).update(items_params).first
    if item.update(items_params)
      redirect_to item_path
    else
      render json: item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    item = Item.where(id: params[:id]).first.destroy
    if item.destroyed?
      redirect_to items_path
    else
      render json: item.errors, status: :unprocessable_entity
    end
  end

  private

  def items_params
    params.permit(:name, :amount, :real, :description, :weight)
  end
end
