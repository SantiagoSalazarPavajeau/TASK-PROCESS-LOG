require './config/environment'


User.create(name: 'Santi', email: 'santi@gmail.com', password: 'password')
User.create(name: 'Yakob', email: 'yakob@gmail.com', password: 'password2')


global_process_1_new_guitar_order = GlobalProcess.create(name: 'New Guitar Order')
global_process_2_custom_guitar = GlobalProcess.create(name: 'Custom Guitar Order')
global_process_3_rental_guitar = GlobalProcess.create(name: 'Guitar Rental Order')


order_administrator = Job.create(name: 'Order Administrator')
gp1_task_1 = Task.create(description: 'Put order into system', job: order_administrator, global_process: global_process_1_new_guitar_order)
gp2_task_1 = Task.create(description: 'Put order into custom guitar system', job: order_administrator, global_process: global_process_2_custom_guitar)
gp3_task_1 = Task.create(description: 'Put order into guitar rental system', job: order_administrator, global_process: global_process_3_rental_guitar)


warehouse_worker = Job.create(name: 'Warehouse Associate')
gp1_task_2 = Task.create(description: 'Pick up new guitar from wharehouse', job: warehouse_worker, global_process: global_process_1_new_guitar_order)
gp3_task_2 = Task.create(description: 'Pick up rental guitar from wharehouse', job: warehouse_worker, global_process: global_process_3_rental_guitar)

guitar_luthier = Job.create(name: 'Guitar Luthier' )
gp2_task_2 = Task.create(description: 'Build guitar to customer requests', job: guitar_luthier, global_process: global_process_2_custom_guitar)

delivery_worker = Job.create(name: 'Delivery Associate')
gp1_task_3 = Task.create(description: 'Deliver guitar to store', job: delivery_worker, global_process: global_process_1_new_guitar_order)
gp2_task_3 = Task.create(description: 'Deliver guitar to customer', job: delivery_worker, global_process: global_process_2_custom_guitar)
gp3_task_3 = Task.create(description: 'Deliver rental guitar to event', job: delivery_worker, global_process: global_process_3_rental_guitar)





