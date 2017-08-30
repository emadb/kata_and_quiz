Beverage machine kata
--

The idea of this kata is to implement the logic to build a Beverage machine that makes beverages (coffee, tea, chocolate) when requested. We will start from simple functionality and grow a more complex logic by adding more cases.
Try to implement this program in TDD adding one functionality at the time. Theres no need to build the user interface.

- As a user I can switch on the coffee machine and it should became ready displaying the credit amount to zero.

- As a user I can insert coins (5, 10, 20 cents) and the displayed credit should grow accordingly.

- The machine accepts only these types of coins: 5, 10, 20 cents. Different type will be returned to customer

- When the credit as reached 30cents as a user I can ask for a coffee and the machine should make it. If the credit is not enough the machine should display a message with the price of the coffee (30cents)

- As a user I can use a prepaied key to obtain a coffee. The key must have a sufficient credit loaded.

- As a user I can cancel the operation having money back.

- If the user inserts more money than needed, the machine should give him the rest

- The machine can deliver different types of beverages: Tea and Chocolate. Tea costs 40cents. Chocolate costs 60cents.

- The prepaied key can be recharded when inserted using the normal coins. The inserted coins sum up to the already present credit on the key.

- As a user if I buy the beverage with the key the costs is lower than normal of 0.5cents.

- As a user I can set the desired level of sugar to use (1 to 5) and the machine must use it to prepare the beverage.

- As a user I can add add-ons to the beverages: hot beverage, sweetener, honey. Every addons costs 10cents and I can add more than one for a single beverage

- Some addons can be used only with specific beverage:
  - Lemon (10cents), Milk (20cents) with Tea
  - Decaf (0cents), Milk (20cents), Cream(20cents) with coffee
  - Whipped Cream(30 cents), nuts (30 cents) with chocolate

- The coffee machine has limited beverage loaded. 50 Tea, 50  Coffee, 50 Chocolate. When the machine runs out of one of them an Administrator must reload the beverage.


