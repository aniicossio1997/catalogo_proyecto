# frozen_string_literal: true

# User.create(email: 'master@master.com', username: 'master', password: 'master')
client = Profile.create(kind: 'client')
admin = Profile.create(kind: 'admin')
User.create(username: 'master', email: 'master@master.com', password: 'master', profile: admin)
user_juan = User.create(username: 'juan', email: 'juan@juan.com', password: 'juan', profile: client)
user_lia = User.create(username: 'lia', email: 'lia@lia.com', password: 'lia', profile: client)

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

# Compras
buy_1 = Buy.new
buy_2 = Buy.new
buy_3 = Buy.new

buy_1.items.<< Item.new(price: Product.first.price,
  count: 1,
  product: Product.first,
  buy: buy_1)
buy_1.user = user_lia
buy_1.save

buy_2.items.<< Item.new(price: Product.find(3).price,
  count: 5,
  product: Product.find(3),
  buy: buy_2)
buy_2.user = user_juan
buy_2.save
Item.create(product: Product.find(4), price: Product.find(4).price, count: 1, buy: buy_2)
Item.create(product: Product.find(5), price: Product.find(5).price, count: 1, buy: buy_2)


buy_3.items.<< Item.new(price: Product.find(2).price,
  count: 2,
  product: Product.find(2),
  buy: buy_3)
buy_3.user = user_lia
buy_3.save

Item.create(product: Product.find(5), price: Product.find(5).price, count: rand(1..10), buy: buy_3)




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
