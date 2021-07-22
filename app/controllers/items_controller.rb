class ItemsController < ApplicationController

  def new
    @collection = Collection.find(params[:collection_id])
    @item = Item.new
    authorize @item
  end

  def create
    @item = Item.new(item_params)
    @collection = Collection.find(params[:collection_id])
    @item.collection = @collection
    @item.save
    authorize @item
    redirect_to collections_path
  end

  def show
    @item = Item.find(params[:id])
    authorize @item
  end

  def edit
    @item = Item.find(params[:id])
    authorize @item
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    authorize @item
    raise
    redirect_to item_path(@item)
  end

  def destroy
    @item = Item.find(params[:id])
    @collection = @item.collection
    @item.destroy
    redirect_to collections_path
    authorize @item
  end

  private

  def item_params
    params.require(:item).permit(:name, :species, :img_url, :description, :price, :collection_id, :favorite)
  end


end
