class LineItemsController < ApplicationController

  def create
    if !!current_user.current_cart
      binding.pry
      cart = Cart.find(current_user.current_cart_id)
    else
      binding.pry
      cart = Cart.new
      current_user.current_cart = cart
    end
    item = Item.find(params[:item_id])
    line_item = cart.add_item(item.id)
    cart.line_items << line_item
    cart.save
    current_user.save
    redirect_to cart_path(cart)
  end

end
