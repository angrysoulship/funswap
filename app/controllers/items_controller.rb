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
<<<<<<< HEAD
=======
    authorize @item
    redirect_to collection_path(@collection)
  end

  def show
    @item = Item.find(params[:id])
>>>>>>> ccb7c7ef85502547d6c39a22b189fb134c900b12
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
    redirect_to item_path(@item)
  end

  def destroy
    @item = Item.find(params[:id])
    @collection = @item.collection
    @item.destroy
    redirect_to collection_path(@collection)
    authorize @item
  end

  private

  def item_params
    params.require(:item).permit(:name, :species, :img_url, :description, :price, :collection_id, :favorite)
  end


end
