class TransactionsController < ApplicationController



  def new
    @item = Item.find(params[:item_id])
    @collection_id = @item.collection_id
    @transaction = Transaction.new
    authorize @transaction

  end

  def create
    @item = Item.find(params[:item_id])
    @buyer_id = current_user.id

    @transaction = Transaction.new( item_id: @item.id, buyer_id: @buyer_id)

    # @transaction.item = @item
    # @seller_collection = Collection.find(@transaction.item.collection_id)

    #change item collection from seller_collection, to buyer_collection

    @item.collection_id = current_user.collections[0].id



    # @seller = User.find(@seller_collection.user_id)
    # @buyer = User.find(@buyer_id)

    @seller_id = @transaction.item.collection.user.id
    # @transaction.buyer_id = current_user.id
    @seller = User.find(@seller_id)

    @seller.balance.amount += @transaction.item.price

    @buyer = current_user
    @buyer.balance.amount -= @transaction.item.price
    @transaction.save
    authorize @transaction
    redirect_to item_path(@item)

  end

private

  def transaction_params
    params.require(:transaction).permit(:item_id, :buyer_id)
  end

end
