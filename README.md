Restaurant Order System (Jac Language)
## Overview
This Jac program simulates a simple restaurant ordering system where a Robot walker visits
multiple Restaurant nodes, displays their available foods, and delivers orders to visitors.
## How It Works
### 1. Restaurant Node
Each restaurant is represented as a Restaurant node.
It includes:
- name: the restaurant’s name
- foods: a list of food items it serves
- add_food(food): a function to add new foods to the menu
- deliver_food: an ability that prints the restaurant’s available food items
node Restaurant {
 has name: str;
 has foods: list = ["Fish", "chapati", "beans"];
 def add_food(food: str){
 self.foods.append(food);
 }
 can deliver_food with Robot entry {
 print(f'Hello Visitor, your food is {self.foods}');
 }
}
### 2. Robot Walker
The Robot is a walker that moves between connected restaurants.
It:
- Starts from the root node and walks through all connected nodes
- Prints each restaurant’s name and menu using the order_food ability
walker Robot {
 can start with root entry {
 print("Robot walker has started walking");
 visit[-->];
 }
 can order_food with Restaurant entry {
 print(f'{here.name}: {here.foods}');
 visit[-->];
 }
}
### 3. Main Execution (Entry Block)
The entry block creates three restaurant nodes (Berkshire, Shawarma, and PizzaIn), adds extra
food items to each, links them together, and spawns the Robot walker.
with entry {
 print('Hello World!');
 berkshire = Restaurant(name='Berkshire', foods=["Hot Tea", "Spiced Tea", "Black Tea"]);
 shawarma = Restaurant(name='Shawarma', foods=["Baked bread", "beef", "lamb chops"]);
 pizza_in = Restaurant(name='PizzaIn');
 berkshire.add_food('Capuccino');
 shawarma.add_food("Kanchi");
 pizza_in.add_food('Marinated chicken');
 root ++> berkshire ++> shawarma ++> pizza_in;
 root spawn Robot();
}
## Running the Code
To run the program, open a terminal in the project directory and execute:
jac restaurantOrder.jac
### Expected Output
- The robot walker starts walking
- Each restaurant’s name and menu are printed
- A delivery message showing the restaurant’s food list is displayed
## Key Concepts Demonstrated
- Nodes (Restaurant) store data and behavior
- Walkers (Robot) traverse nodes and trigger actions
- self is used to access a node’s own properties (e.g., self.foods)
- Graph links (++>) connect nodes so the walker can travel between them