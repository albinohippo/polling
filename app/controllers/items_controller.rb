class ItemsController < ApplicationController
  def index
  	@items = Item.where(:poll_id => params[:poll_id])
  	render json: @items
  end

  def create
    @item = Item.new(params[:item])
    if @item.save
      render json: @item, status: :created, location: @item
    else
			render json: @item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    head :no_content
  end
end