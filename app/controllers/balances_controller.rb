class BalancesController < ApplicationController

  
  def index
    @balances = policy_scope(Balance)
    @balance = Balance.find(current_user.id)
  end



  def create
    @balance = Balance.new
    @balance.user = current_user
    @balance.save
    authorize @balance
    redirect_to collections_path
  end

  def edit
    @balance = Balance.find(params[:id])
    authorize @balance
  end

  def update
    @balance = Balance.find(params[:id])
    @balance.update(balance_params)
    authorize @balance
    redirect_to collections_path
  end

  private

  def balance_params
    params.require(:balance).permit(:amount)
  end
end

