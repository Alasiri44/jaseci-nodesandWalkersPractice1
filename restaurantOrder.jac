node Restaurant {
    has name: str;
    has foods: list = ["Fish", "chapati", "beans"];

    def add_food(food: str){
        self.foods.append(food);
    }

}

walker Robot {
    has name: str = "Elegant";

    can start with `root entry {
        print(f"Robot walker {self.name} has started walking");
        visit[-->];
    }

    can order_food with Restaurant entry{
        print(f'{here.name}: {here.foods}');
        visit[-->];
    }
}



with entry {
    print('Hello World!');
    berkshire = Restaurant(name='Berkshire', foods=["Hot Tea", "Spiced Tea", "Black Tea"]);
    shawarma = Restaurant(name='Shawarma', foods=["Baked bread", "beef", "lamb chops"]);
    pizza_in = Restaurant(name='PizzaIn' );

    berkshire.add_food('Capuccino');
    shawarma.add_food("Kanchi");
    pizza_in.add_food('Marinated chicken');

    root ++> berkshire ++> shawarma ++> pizza_in;

    root spawn Robot();
}