require './config/environment'


santi = User.create(name: 'Santi', email: 'santi@gmail.com', password: 'password', )

global_process_1_new_guitar_order = GlobalProcess.create(name: 'New Guitar Order', user: santi)
global_process_2_custom_guitar = GlobalProcess.create(name: 'Custom Guitar Order', user: santi)
global_process_3_rental_guitar = GlobalProcess.create(name: 'Guitar Rental Order', user: santi)


order_administrator = Job.create(name: 'Order Administrator', user: santi)
gp1_task_1 = Task.create(description: 'Put order into system', job: order_administrator, global_process: global_process_1_new_guitar_order, user: santi)
gp2_task_1 = Task.create(description: 'Put order into custom guitar system', job: order_administrator, global_process: global_process_2_custom_guitar, user: santi)
gp3_task_1 = Task.create(description: 'Put order into guitar rental system', job: order_administrator, global_process: global_process_3_rental_guitar, user: santi)


warehouse_worker = Job.create(name: 'Warehouse Associate', user: santi)
gp1_task_2 = Task.create(description: 'Pick up new guitar from wharehouse', job: warehouse_worker, global_process: global_process_1_new_guitar_order, user: santi)
gp3_task_2 = Task.create(description: 'Pick up rental guitar from wharehouse', job: warehouse_worker, global_process: global_process_3_rental_guitar, user: santi)

guitar_luthier = Job.create(name: 'Guitar Luthier' , user: santi)
gp2_task_2 = Task.create(description: 'Build guitar to customer requests', job: guitar_luthier, global_process: global_process_2_custom_guitar, user: santi)

delivery_worker = Job.create(name: 'Delivery Associate', user: santi)
gp1_task_3 = Task.create(description: 'Deliver guitar to store', job: delivery_worker, global_process: global_process_1_new_guitar_order, user: santi)
gp2_task_3 = Task.create(description: 'Deliver guitar to customer', job: delivery_worker, global_process: global_process_2_custom_guitar, user: santi)
gp3_task_3 = Task.create(description: 'Deliver rental guitar to event', job: delivery_worker, global_process: global_process_3_rental_guitar, user: santi)



yakob = User.create(name: 'Yakob', email: 'yakob@gmail.com', password: 'password2')

food_order = GlobalProcess.create(name: 'Food Order', user: yakob)
bar_order = GlobalProcess.create(name: 'Bar Order', user: yakob)
online_order = GlobalProcess.create(name: 'Online Order', user: yakob)


server = Job.create(name: 'Server', user: yakob)
cash_register_food = Task.create(description: 'Take order & Put food order into cash register', job: server, global_process: food_order, user: yakob)
deliver_and_charge = Task.create(description: 'Deliver drink to customer and take payment', job: server, global_process: bar_order, user: yakob)


cook = Job.create(name: 'Cook', user: yakob)
cook_food = Task.create(description: 'Prepare food ', job: cook, global_process: food_order, user: yakob)
cook_food_to_online_order = Task.create(description: 'Prepare food to online request', job: cook, global_process: online_order, user: yakob)


bartender = Job.create(name: 'Bartender', user: yakob)
take_bar_order = Task.create(description: 'Take order', job: bartender, global_process: bar_order, user: yakob)
make_drink = Task.create(description: 'Make drink with ingredients', job: bartender, global_process: bar_order, user: yakob)


food_runner = Job.create(name: 'Food Runner', user: yakob)
deliver_food = Task.create(description: 'Deliver food to customer', job: food_runner, global_process: food_order, user: yakob)
give_online_order = Task.create(description: 'Give online order food to customer', job: food_runner, global_process: online_order, user: yakob)














