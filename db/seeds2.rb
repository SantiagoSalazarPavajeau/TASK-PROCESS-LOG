yakob = User.create(name: 'Yakob', email: 'yakob@gmail.com', password: 'password2')


food_order = GlobalProcess.create(name: 'Food Order', user: yakob)
cash_register_food = Task.create(description: 'Take order & Put food order into cash register', job: server, global_process: food_order, user: yakob)
cook_food = Task.create(description: 'Prepare food ', job: cook, global_process: food_order, user: yakob)
deliver_food = Task.create(description: 'Deliver food to customer', job: food_runner, global_process: food_order, user: yakob)


bar_order = GlobalProcess.create(name: 'Bar Order', user: yakob)
take_bar_order = Task.create(description: 'Take order', job: bartender, global_process: bar_order, user: yakob)
make_drink = Task.create(description: 'Make drink with ingredients', job: bartender, global_process: bar_order, user: yakob)
deliver_and_charge = Task.create(description: 'Deliver drink to customer and take payment', job: bartender, global_process: bar_order, user: yakob)

online_order = GlobalProcess.create(name: 'Online Order', user: yakob)
cook_food_to_online_order = Task.create(description: 'Prepare food to online request', job: cook, global_process: online_order, user: yakob)
give_online_order = Task.create(description: 'Give online order food to customer', job: food_runner, global_process: online_order, user: yakob)


server = Job.create(name: 'Server', user: yakob)
cook = Job.create(name: 'Cook', user: yakob)
bartender = Job.create(name: 'Bartender', user: yakob)
food_runner = Job.create(name: 'Food Runner', user: yakob)


