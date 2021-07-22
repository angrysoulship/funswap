class TransactionsController < ApplicationController



  def new
    @item = Item.find(params[:item_id])
    @collection_id = @item.collection_id
    @transaction = Transaction.new
    authorize @transaction

  end

  def create

    #找到交易物品，创立新的交易
    @item = Item.find(params[:item_id])
    @buyer_id = current_user.id
    @transaction = Transaction.new( item_id: @item.id, buyer_id: @buyer_id)

    # 换buyer的balance，也就是current_user balance
    @balance = Balance.find(@buyer_id)
    @balance.amount -= @transaction.item.price
    @balance.update(amount: @balance.amount)
    
    #换seller的bal1ance
    @seller_id = @item.collection.user.id
    @balance1 = Balance.find(@seller_id)
    @balance1.amount += @transaction.item.price
    @balance1.update(amount: @balance1.amount)
   
    #物品进行置换
    @item.collection_id = current_user.collections[0].id
    @item.save

    #存item, buyer, seller的id, 交易保存
    
    @transaction.update(item_id: @item.id, buyer_id: current_user.id, seller_id: @seller_id)
    
  
    authorize @transaction
    redirect_to item_path(@item)

  end

  def update
    @transaction = Transaction.find(params[:id])
    @transaction.update(transaction_params)
    authorize @transaction
    redirect_to collections_path
  end

private

  def transaction_params
    params.require(:transaction).permit(:item_id, :buyer_id, :seller_id)
  end

end
