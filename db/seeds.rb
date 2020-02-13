require './config/environment'


santis_motorcycle_shop = User.create(name: "Santi's Motorcycle Shop", email: 'santis_motorcycle_shop@gmail.com', password: 'password' )

new_bike = GlobalProcess.create(name: 'New Bike Order', user: santis_motorcycle_shop)
custom_bike = GlobalProcess.create(name: 'Custom Bike Order', user: santis_motorcycle_shop)
bike_parts = GlobalProcess.create(name: 'Bike Parts Order', user: santis_motorcycle_shop)


bike_salesperson = Job.create(name: 'Salesperson', user: santis_motorcycle_shop)
consult_customer_new_bike = Task.create(description: 'Take customer new bike order and put order into system', job: bike_salesperson, global_process: new_bike, user: santis_motorcycle_shop)
consult_customer_custom_bike = Task.create(description: 'Consult and put custom order into system', job: bike_salesperson, global_process: custom_bike, user: santis_motorcycle_shop)
consult_customer_bike_parts = Task.create(description: 'Put order in parts system', job: bike_salesperson, global_process: bike_parts, user: santis_motorcycle_shop)


warehouse_worker = Job.create(name: 'Warehouse Worker', user: santis_motorcycle_shop)
pick_up_new_bike = Task.create(description: 'Pick up new motorcycle from wharehouse', job: warehouse_worker, global_process: new_bike, user: santis_motorcycle_shop)
pick_up_bike_parts = Task.create(description: 'Pick up parts from wharehouse', job: warehouse_worker, global_process: bike_parts, user: santis_motorcycle_shop)

bike_builder = Job.create(name: 'Bike Builder' , user: santis_motorcycle_shop)
gp2_task_2 = Task.create(description: 'Build bike to customer requests', job: bike_builder, global_process: custom_bike, user: santis_motorcycle_shop)

delivery_worker = Job.create(name: 'Delivery Worker', user: santis_motorcycle_shop)
deliver_new_bike = Task.create(description: 'Deliver bike to store', job: delivery_worker, global_process: new_bike, user: santis_motorcycle_shop)
deliver_custom_bike = Task.create(description: 'Deliver bike to customer', job: delivery_worker, global_process: custom_bike, user: santis_motorcycle_shop)
deliver_parts = Task.create(description: 'Deliver parts to customer', job: delivery_worker, global_process: bike_parts, user: santis_motorcycle_shop)



santis_steakhouse = User.create(name: "Santi's Steakhouse", email: 'santis_steakhouse@gmail.com', password: 'password2')

food_order = GlobalProcess.create(name: 'Food Order', user: santis_steakhouse)
bar_order = GlobalProcess.create(name: 'Bar Order', user: santis_steakhouse)
online_order = GlobalProcess.create(name: 'Online Order', user: santis_steakhouse)


server = Job.create(name: 'Server', user: santis_steakhouse)
take_food_order = Task.create(description: 'Take food order', job: server, global_process: food_order, user: santis_steakhouse)
cash_register = Task.create(description: 'Put food order into register', job: server, global_process: food_order, user: santis_steakhouse)
charge_payment = Task.create(description: 'Bring check and charge', job: server, global_process: food_order, user: santis_steakhouse)


cook = Job.create(name: 'Cook', user: santis_steakhouse)
cook_food = Task.create(description: 'Prepare food ', job: cook, global_process: food_order, user: santis_steakhouse)
cook_food_to_online_order = Task.create(description: 'Prepare food to online request', job: cook, global_process: online_order, user: santis_steakhouse)


bartender = Job.create(name: 'Bartender', user: santis_steakhouse)
take_bar_order = Task.create(description: 'Take order', job: bartender, global_process: bar_order, user: santis_steakhouse)
make_drink = Task.create(description: 'Make drink with ingredients', job: bartender, global_process: bar_order, user: santis_steakhouse)
deliver_and_charge_drink = Task.create(description: 'Deliver drink to customer and take payment', job: bartender, global_process: bar_order, user: santis_steakhouse)



food_runner = Job.create(name: 'Food Runner', user: santis_steakhouse)
deliver_food = Task.create(description: 'Deliver food to customer', job: food_runner, global_process: food_order, user: santis_steakhouse)
give_online_order = Task.create(description: 'Give online order food to customer', job: food_runner, global_process: online_order, user: santis_steakhouse)














