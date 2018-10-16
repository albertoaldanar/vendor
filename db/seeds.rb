require "date"

d = DateTime.parse('19 Aug 2018 04:05:06+03:30')
d2 = DateTime.parse('19 Aug 2018 07:05:06+03:30')

b = DateTime.parse('20 Aug 2018 04:05:06+03:30')
b2 = DateTime.parse('20 Aug 2018 07:05:06+03:30')

admin = Admin.last

user = User.new
  user.name = 'Carlos Baez'
  user.password = "carlosbaez"
  user.password_confirmation = 'carlosbaez'
  user.team_id = 1
  user.points = 0
  user.sells = 0
  user.save

user = User.new
  user.name = 'Luz Maria'
  user.password = "luzmaria"
  user.password_confirmation = 'luzmaria'
  user.team_id = 1
  user.points = 0
  user.sells = 0
  user.save

user = User.new
  user.name = 'Carlos Guerrero'
  user.password = "carlosguerrero"
  user.password_confirmation = 'carlosguerrero'
  user.team_id = 1
  user.points = 0
  user.sells = 0
  user.save

user = User.new
  user.name = 'Carlos Bacca'
  user.password = "carlosbacca"
  user.password_confirmation = 'carlosbacca'
  user.team_id = 2
  user.points = 0
  user.sells = 0
  user.save

task = Task.new
  task.desc = 'Tengo que llamar al cliente para cerrar la venta'
  task.title = "Llamar cliente"
  task.client= 'Jose Jimenez'
  task.user_id = user.id
  task.startDate = d
  task.endDate = d
  task.save

task = TaskAdmin.new
  task.description = 'Junta de equipo'
  task.title = "Junta de equipo"
  task.admin_id = admin.id
  task.time = b
  task.save
