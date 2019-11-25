# User.create(email: 'master@master.com', username: 'master', password: 'master')
  client = Profile.create(kind: 'client')
  admin = Profile.create(kind: 'admin')
  User.create(username: 'cliente', email: 'cliente@cliente.com', password: 'cliente', profile: client)
  User.create(username: 'master', email: 'master@master.com', password: 'master', profile: admin)
  Config.create(per_page: 3)
  Category.create(name: 'Bazar')
  Category.create(name: 'Jugueteria')
  Category.create(name: 'Electronica')

  Tag.create(name: 'historico')
  Tag.create(name: 'cosas generales')

  Config.create(per_page: 3)
