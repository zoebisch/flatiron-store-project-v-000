10.times do
  Item.create(
    title: Faker::Commerce.product_name,
    inventory: Faker::Number.number(2),
    price: Faker::Number.number(4)
  )
  Category.create(title: Faker::Commerce.department)
end

counter = 1
Item.all.each do |item|
  item.category_id = counter
  item.save
  counter += 1
end

user = User.new(:email =>"bob@gmail.com", :password =>"bobatgmail", :password_confirmation =>"bobatgmail")
user.save!
cart = Cart.new
cart.save
user.current_cart = cart
user.save
