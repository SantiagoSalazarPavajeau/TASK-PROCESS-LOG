
global_process_1_new_guitar_order = GlobalProcess.create(name: 'Food Order')
gp1_task_1 = Task.create(description: 'Take order & Put food order into cash register', job: server, global_process: global_process_1_new_guitar_order)
gp1_task_2 = Task.create(description: 'Prepare food ', job: cook, global_process: global_process_1_new_guitar_order)
gp1_task_3 = Task.create(description: 'Deliver food to customer', job: food_runner, global_process: global_process_1_new_guitar_order)


global_process_2_custom_guitar = GlobalProcess.create(name: 'Bar Order')
gp2_task_1 = Task.create(description: 'Put order into custom guitar system', job: order_administrator, global_process: global_process_2_custom_guitar)
gp2_task_2 = Task.create(description: 'Build guitar to customer requests', job: guitar_luthier, global_process: global_process_2_custom_guitar)
gp2_task_3 = Task.create(description: 'Deliver guitar to customer', job: delivery_worker, global_process: global_process_2_custom_guitar)

global_process_3_rental_guitar = GlobalProcess.create(name: 'Online Order')


server = Job.create(name: 'Server')
gp1_task_1 = Task.create(description: 'Put order into system', job: order_administrator, global_process: global_process_1_new_guitar_order)
gp2_task_1 = Task.create(description: 'Put order into custom guitar system', job: order_administrator, global_process: global_process_2_custom_guitar)
gp3_task_1 = Task.create(description: 'Put order into guitar rental system', job: order_administrator, global_process: global_process_3_rental_guitar)


cook = Job.create(name: 'Cook')
gp1_task_2 = Task.create(description: 'Pick up new guitar from wharehouse', job: warehouse_worker, global_process: global_process_1_new_guitar_order)
gp3_task_2 = Task.create(description: 'Pick up rental guitar from wharehouse', job: warehouse_worker, global_process: global_process_3_rental_guitar)

bartender = Job.create(name: 'Bartender' )
gp2_task_2 = Task.create(description: 'Build guitar to customer requests', job: guitar_luthier, global_process: global_process_2_custom_guitar)

food_runner = Job.create(name: 'Food Runner')
gp1_task_3 = Task.create(description: 'Deliver guitar to store', job: delivery_worker, global_process: global_process_1_new_guitar_order)
gp2_task_3 = Task.create(description: 'Deliver guitar to customer', job: delivery_worker, global_process: global_process_2_custom_guitar)
gp3_task_3 = Task.create(description: 'Deliver rental guitar to event', job: delivery_worker, global_process: global_process_3_rental_guitar)

