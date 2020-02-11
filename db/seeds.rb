require './config/environment'


santis_guitar_store = User.create(name: "Santi's Guitar Store", email: 'santis_guitar_store@gmail.com', password: 'password' )

global_process_1_new_guitar_order = GlobalProcess.create(name: 'New Guitar Order', user: santis_guitar_store)
global_process_2_custom_guitar = GlobalProcess.create(name: 'Custom Guitar Order', user: santis_guitar_store)
global_process_3_rental_guitar = GlobalProcess.create(name: 'Guitar Rental Order', user: santis_guitar_store)


order_administrator = Job.create(name: 'Order Administrator', user: santis_guitar_store)
gp1_task_1 = Task.create(description: 'Put order into system', job: order_administrator, global_process: global_process_1_new_guitar_order, user: santis_guitar_store)
gp2_task_1 = Task.create(description: 'Put order into custom guitar system', job: order_administrator, global_process: global_process_2_custom_guitar, user: santis_guitar_store)
gp3_task_1 = Task.create(description: 'Put order into guitar rental system', job: order_administrator, global_process: global_process_3_rental_guitar, user: santis_guitar_store)


warehouse_worker = Job.create(name: 'Warehouse Associate', user: santis_guitar_store)
gp1_task_2 = Task.create(description: 'Pick up new guitar from wharehouse', job: warehouse_worker, global_process: global_process_1_new_guitar_order, user: santis_guitar_store)
gp3_task_2 = Task.create(description: 'Pick up rental guitar from wharehouse', job: warehouse_worker, global_process: global_process_3_rental_guitar, user: santis_guitar_store)

guitar_luthier = Job.create(name: 'Guitar Luthier' , user: santis_guitar_store)
gp2_task_2 = Task.create(description: 'Build guitar to customer requests', job: guitar_luthier, global_process: global_process_2_custom_guitar, user: santis_guitar_store)

delivery_worker = Job.create(name: 'Delivery Associate', user: santis_guitar_store)
gp1_task_3 = Task.create(description: 'Deliver guitar to store', job: delivery_worker, global_process: global_process_1_new_guitar_order, user: santis_guitar_store)
gp2_task_3 = Task.create(description: 'Deliver guitar to customer', job: delivery_worker, global_process: global_process_2_custom_guitar, user: santis_guitar_store)
gp3_task_3 = Task.create(description: 'Deliver rental guitar to event', job: delivery_worker, global_process: global_process_3_rental_guitar, user: santis_guitar_store)



yakobs_steakhouse = User.create(name: "Yakob's Steakhouse", email: 'yakobs_steakhouse@gmail.com', password: 'password2')

food_order = GlobalProcess.create(name: 'Food Order', user: yakobs_steakhouse)
bar_order = GlobalProcess.create(name: 'Bar Order', user: yakobs_steakhouse)
online_order = GlobalProcess.create(name: 'Online Order', user: yakobs_steakhouse)


server = Job.create(name: 'Server', user: yakobs_steakhouse)
take_food_order = Task.create(description: 'Take food order', job: server, global_process: food_order, user: yakobs_steakhouse)
cash_register = Task.create(description: 'Put food order into register', job: server, global_process: food_order, user: yakobs_steakhouse)
charge_payment = Task.create(description: 'Bring check and charge', job: server, global_process: food_order, user: yakobs_steakhouse)





cook = Job.create(name: 'Cook', user: yakobs_steakhouse)
cook_food = Task.create(description: 'Prepare food ', job: cook, global_process: food_order, user: yakobs_steakhouse)
cook_food_to_online_order = Task.create(description: 'Prepare food to online request', job: cook, global_process: online_order, user: yakobs_steakhouse)


bartender = Job.create(name: 'Bartender', user: yakobs_steakhouse)
take_bar_order = Task.create(description: 'Take order', job: bartender, global_process: bar_order, user: yakobs_steakhouse)
make_drink = Task.create(description: 'Make drink with ingredients', job: bartender, global_process: bar_order, user: yakobs_steakhouse)
deliver_and_charge_drink = Task.create(description: 'Deliver drink to customer and take payment', job: bartender, global_process: bar_order, user: yakobs_steakhouse)



food_runner = Job.create(name: 'Food Runner', user: yakobs_steakhouse)
deliver_food = Task.create(description: 'Deliver food to customer', job: food_runner, global_process: food_order, user: yakobs_steakhouse)
give_online_order = Task.create(description: 'Give online order food to customer', job: food_runner, global_process: online_order, user: yakobs_steakhouse)














