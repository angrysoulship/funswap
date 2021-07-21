class TransactionsController < ApplicationController



  def new
    @item = Item.find(params[:item_id])
    @transaction = Transaction.new
    authorize @transaction
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @item = Item.find(params[:item_id])
    @transaction.item = @item
    @transaction.seller_id = @transaction.item.collection.user.id
    @transaction.buyer_id = current_user.id
    seller = User.find(@transaction.seller_id)
    seller.balance += @transaction.item.price
    buyer = User.find(@transaction.buyer_id)
    buyer.balance -= @transaction.item.price

    authorize @transaction
    if @transaction.save

      redirect_to item_path(@item)

    else
      render 'new'
    end
  end

private

  def transaction_params
    params.require(:transaction).permit(:item_id, :buyer_id)
  end

end
