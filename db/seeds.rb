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
Category.create(name: '')

Tag.create(name: 'historico')
Tag.create(name: 'cosas generales')

5.times do |i|
  p = Product.new(name: "Product ##{i}",
                  description: 'A product.',
                  price: 250,
                  cost: 200,
                  active: true,
                  code: i,
                  category_id: 1)
  p.product_images.build(principal: true)
  p.save
end

Buy.create(state: 'pending', user: User.first)
Buy.create(state: 'accepted', user: User.first)
Buy.create(state: 'rejected', user: User.first)
# pending
Item.create(product: Product.first, price: Product.first.price, count: 3, buy: Buy.first)
# rejected
Item.create(product: Product.last, price: Product.last.price, count: 2, buy: Buy.last)
Item.create(product: Product.find(3), price: Product.find(3).price, count: 2, buy: Buy.last)
Item.create(product: Product.last, price: Product.last.price, count: 2, buy:  Buy.last)
# accepted
Item.create(product: Product.last, price: Product.last.price, count: 2, buy:  Buy.find(2))
Item.create(product: Product.last, price: Product.last.price, count: 2, buy:  Buy.find(2))
Item.create(product: Product.find(2), price: Product.find(2).price, count: 3, buy: Buy.find(2))
