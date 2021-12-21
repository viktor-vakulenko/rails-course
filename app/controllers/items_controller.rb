class ItemsController < ApplicationController
  layout false
  skip_before_action :verify_authenticity_token

  before_action :find_item, only: %i[show edit update create destroy upvote downvote expensive]
  before_action :is_admin, only: %i[destroy]


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
    render body: 'Error 404', status: 404 unless @item
  end

  def show
    render body: 'Error 404', status: 404 unless @item
    # if @item
    #   render 'items/show'
    # else
    #   render body: "Error 404"
    # end
  end

  def update
    if @item.update(items_params)
      redirect_to item_path
    else
      render json: item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @item.destroy.destroyed?
      redirect_to items_path
    else
      render json: item.errors, status: :unprocessable_entity
    end
  end

  def upvote
    @item.increment! :votes_count
    redirect_to items_path
  end

  def downvote
    @item.decrement! :votes_count
    redirect_to items_path
  end

  def expensive
    if !(@items = Item.where('amount > 1000'))
      render json item.errors, status: :unprocessable_entity
    else
      render :index
    end

  end
  private

  def items_params
    params.permit(:name, :amount, :real, :description, :weight, :votes_count)
  end

  def find_item
    @item = Item.where(id: params[:id]).first
  end

  def is_admin
    # render_403 unless params[:admin]
    # render json: 'access denied', status: :forbidden unless params[:admin]
    true
  end


end

