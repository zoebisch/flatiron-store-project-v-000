class CartsController < ApplicationController

  def show
    @current_cart = Cart.find(params[:id])
    @user = current_user
  end

  def checkout
    @current_cart = Cart.find(params[:id])
    @user = User.find(@current_cart[:user_id])
    @current_cart.checkout_items
    redirect_to cart_path(@current_cart)
  end


  private

  def cart_params
  end

end
