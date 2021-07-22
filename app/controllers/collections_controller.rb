class CollectionsController < ApplicationController
  def index
    @collections = policy_scope(Collection)
  end

  def new
    @collection = Collection.new
    authorize @collection
  end

  def create
    @collection = Collection.new(collection_params)
    @collection.user = current_user
    @collection.save
    authorize @collection
    redirect_to collections_path
  end

  def show
    @collection = Collection.find(params[:id])
    authorize @collection
  end

  def edit
    @collection = Collection.find(params[:id])
    authorize @collection
  end

  def update
    @collection = Collection.find(params[:id])
    @collection.update(collection_params)
    authorize @collection
    redirect_to collection_path(@collection)
  end

  def destroy
    @collection = Collection.find(params[:id])
    @collection.destroy
    authorize @collection
    redirect_to collections_path, notice: 'Collection is deleted.'
  end

  private

  def collection_params
    params.require(:collection).permit(:name, :user)
  end
end
