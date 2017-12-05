class Item < ActiveRecord::Base
  has_many :line_items
  belongs_to :category

  def self.available_items
    Item.all.find_all{|obj| obj.inventory >= 1}
  end

end
