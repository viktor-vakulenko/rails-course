class ItemsController < ApplicationController
  # layout false
  skip_before_action :verify_authenticity_token

  before_action :find_item, only: %i[show edit update create destroy upvote downvote expensive]
  # before_action :admin?, only: %i[destroy]


  def index
    @items = Item.all
    # @items = Item
    # @items = @items.where('amount >= ?', params[:price_from]) if params[:price_from]
    # @items = @item.where('created_at >= ?', 1.day.ago) if params[:today]
    # @items = @items.order(:id)
  end

  def create
    @item = Item.create(items_params)
    if @item.persisted?
      flash[:success] = 'Item saved!'

      # render body: 'Hello, world'
      redirect_to items_path
    else
      # render json: item.errors, status: :unprocessable_entity
      flash.now[:error] = 'Price is required'
      render :new
    end
  end

  def new
    @item = Item.new
  end

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
      flash[:success] = 'Item updated'
    else
      flash.now[:error] = 'Item not updated'
      render :edit
    end
  end

  def destroy
    if @item.destroy.destroyed?
      flash.now[:success] = 'Item deleted'
      redirect_to items_path
    else
      flash.now[:error] = 'Item not deleted'
      render :index
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
    params.require(:item).permit(:name, :amount, :real, :description, :weight, :votes_count)
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

