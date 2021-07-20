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
