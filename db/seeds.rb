# frozen_string_literal: true

# User.create(email: 'master@master.com', username: 'master', password: 'master')
client = Profile.create(kind: 'client')
admin = Profile.create(kind: 'admin')
User.create(username: 'cliente', email: 'cliente@cliente.com', password: 'cliente', profile: client)
User.create(username: 'master', email: 'master@master.com', password: 'master', profile: admin)
User.create(username: 'may', email: 'may@may.com', password: 'may', profile: client)

Config.create(per_page: 3)
Category.create(name: 'Bazar')
Category.create(name: 'Jugueteria')
Category.create(name: 'Electronica')
Category.create(name: 'Limpieza')
Category.create(name: 'Comida')

Tag.create(name: 'historico')
Tag.create(name: 'cosas generales')

10.times do |i|
  p = Product.new(name: "Product ##{i}",
                  description: 'A product.',
                  price: rand(5000),
                  cost: rand(5000),
                  active: true,
                  code: rand(10_000),
                  category_id: rand(1..5))
  p.product_images.build(principal: true)
  p.save
end

Buy.create(state: 'pending', user: User.find(rand(1..3)))
Buy.create(state: 'accepted', user: User.find(rand(1..3)))
Buy.create(state: 'rejected', user: User.find(rand(1..3)))
# pending
Item.create(product: Product.first, price: Product.first.price, count: rand(1..10), buy: Buy.first)
# rejected
Item.create(product: Product.last, price: Product.last.price, count: rand(1..10), buy: Buy.last)
Item.create(product: Product.find(3), price: Product.find(3).price, count: rand(1..10), buy: Buy.last)
Item.create(product: Product.last, price: Product.last.price, count: rand(1..10), buy:  Buy.last)
# accepted
Item.create(product: Product.last, price: Product.last.price, count: rand(1..10), buy:  Buy.second)
Item.create(product: Product.last, price: Product.last.price, count: rand(1..10), buy:  Buy.second)
Item.create(product: Product.find(2), price: Product.find(2).price, count: rand(1..10), buy: Buy.second)

# Sliders
images_path = 'app/assets/images/'
Slider.create(name: 'Coca cola').image.attach(
  io: File.open(images_path + 'coke.png'),
  filename: 'coke.png'
)
Slider.create(name: 'PlayStation 5').image.attach(
  io: File.open(images_path + 'play5.jpg'),
  filename: 'play5.png'
)
