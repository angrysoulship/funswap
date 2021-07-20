class ItemsController < ApplicationController

  def new
    @collection = Collection.find(params[:collection_id])
    @item = Item.new
    authorize @item
  end

  def create
    @item = Item.new(collection_params)
    @collection = Collection.find(params[:collection_id])
    @item.collection = @collection
    @item.save
    authorize @item
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def collection_params
    params.require(:item).permit(:name, :species, :img_url, :description, :price, :collection_id, :favorite)
  end


end
