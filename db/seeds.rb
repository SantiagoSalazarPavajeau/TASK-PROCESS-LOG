
User.create(name: 'Santi', email: 'santi@gmail.com', password: 'password')

global_process_1 = Process.create(name: 'Guitar Order')
global_process_2 = Process.create(name: 'Custom Guitar Order')
global_process_3 = Process.create(name: 'Guitar Rental Order')


order_administrator = Job.create(name: 'Order Administrator')
gp1_task_1 = Task.create(description: 'Put order into system')
gp2_task_1 = Task.create(description: 'Put order into custom guitar system')
gp3_task_1 = Task.create(description: 'Put order into guitar rental system')


warehouse_worker = Job.create(name: 'Warehouse Associate')
gp1_task_2 = Task.create(description: 'Pick up new guitar from wharehouse')
gp3_task_2 = Task.create(description: 'Pick up rental guitar from wharehouse')

delivery_worker = Job.create(name: 'Delivery Associate')
gp1_task_3 = Task.create(description: 'Deliver guitar to store')
gp2_task_3 = Task.create(description: 'Deliver guitar to customer')
gp3_task_3 = Task.create(description: 'Deliver rental guitar to event')


guitar_luthier = Job.create(name: 'Guitar Luthier')
gp2_task_2 = Task.create(description: 'Build guitar to customer requests')




