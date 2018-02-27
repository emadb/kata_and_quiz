# Beverage machine kata

The idea of this kata is to implement the logic to build a Beverage machine controller that makes beverages (coffee, tea, chocolate) when requested. It will start from simple functionality and grow to a more complex logic by adding more cases.

Try to implement this program in TDD adding one functionality at the time. Theres no need to build the user interface, just stick to the user story.
The stories are divided in three groups.

### Basic machine operation with coins and keys

- When the coffee machine starts it is ready to operate and the credit is zero.

- As a user I can insert coins of different format (5, 10, 20 cents) and the displayed credit should grow accordingly.

- As a user I can use a prepaied key. The key can have some credit loaded and it will be displayed. The user can recharge the key using the coins.

- As a user I can cancel the operation and have the money back.

### Making beverages

- When the credit as reached 30cents I can make a coffee. If the credit is not enough the machine should display a message with the price of the coffee (30cents)

- If the user inserts more money than needed, the machine should give him the rest

- The machine can deliver different types of beverages: Tea and Chocolate. Tea costs 40cents. Chocolate costs 60cents.

- As a user if I buy the beverage with the key the costs is lower than normal of 0.5cents.

### Add-ons

- As a user I can set the desired level of sugar to use (1 to 5) and the machine must use it to prepare the beverage.

- As a user I can add add-ons to the beverages: hot beverage, sweetener, honey. Every addons costs 10cents and I can add more than one for a single beverage

- Some addons can be used only with specific beverage:
  - Lemon (10cents), Milk (20cents) with Tea
  - Decaf (0cents), Milk (20cents), Cream(20cents) with coffee
  - Whipped Cream(30 cents), nuts (30 cents) with chocolate

### Extra

- The coffee machine has limited beverage loaded. 50 Tea, 50  Coffee, 50 Chocolate. When the machine runs out of one of them an Administrator must reload the beverage.

