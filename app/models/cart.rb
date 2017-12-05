class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items
  attr_accessor :status

  def show
    binding.pry
  end

  def total
    total = 0.0
    self.line_items.each do |item|
      total += Item.find(item.id).price * item.quantity
    end
    total
  end

  def add_item(item_id)
    new_item = LineItem.new(id: item_id)
    new_item.item_id = item_id
    new_item.cart_id = self.id
    if self.line_items.detect{|item| item.id == item_id}
      item = self.line_items.find{|item| item.id == item_id}
      item.quantity += 1
      item.save
      item
    else
      new_item
    end
  end

  def checkout_items
    self.line_items.each do |item|
      @item = Item.find(item.id)
      @item.inventory -= item.quantity
      @item.save
    end
    self.line_items.clear
    self.save
    @user = User.find(self.user_id)
    @user.current_cart = nil
    @user.save
    @cart = Cart.find(self.id)
    @cart.destroy
  end

  def status
  end

end
