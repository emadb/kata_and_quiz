Hotel reservations
## 1) Availability check 
A potential customer wants to verify it there is a room for their family and eventually know the price. The customer query the software using this search criteria:
- Arrival date and Departure date: date range in which they want to spend the holiday in the hotel
- Number of people that need a reservation (adults and children, children get 20% off discount)
- Optional: type of room from a list of options.

Given these criteria the application must check inside its calendar if there are available rooms that matches the criteria and in case calculate the price of the entire holiday (it it a base price B&B).
For every option it should return the details that contains the room type and the description of the room.

This hotel has these types of room:
1. Room (100 euro/night) with 1 single bed and maximum 2 additional beds (Suited for 1-3 people)
2. Double-room (110 euro/night) with 1 double-bed and maximum 2 additional beds (Suited for 1-4 people)
3. Family room (120 euro/night) with 1 double-bed and 3 additional beds (Suited for families of 3-5 people)

Each room can be of different type:
- Standard (1x actual price)
- Superior (1.1x actual price) (bigger room)
- Suite (2x actual price) (bigger with more facilities)

For each room there is the _sea front_ option that increase the price of 15%.

The hotel has (half of them are sea front)
- 12 rooms of type 1 (6 standard + 6 superior)
- 12 rooms of type 2 (4 standard + 4 superior + 2 suite)
- 6 rooms of type 3 (2 standard + 2 superior + 2 suite)

## 2)  Online reservation process
Once the customer has chose their preferred option they can proceed with the real reservation.
The customer input:
- Checkin date and Checkout date
- Number of people (adults and children)

The room type is implicit from the selection of step 1.
The reservation flow is:
1. The user selects from step 1 which solution they like
2. Once selected the app should block the room for that period of time for 15 minutes to let the user complete the reservation process
3. The user inputs their personal data: for every customer:
	- first name
	- last name
	- age
4. If the user has some promo code they input them now
5. The user choose the type of treatment: half-board, full-board, B&B
6. The application calculate a total amount of holiday
7. The user pays 30% of the total as a confirmation
8. The application return a reservation code that user can use during the checkin

- The half-board treatments cost 20 euro/day/person 
- The full-board treatments cost 35 euro/day/person 


## 3) Check-in process
The check-in process starts when the holiday begins. The user inputs their reservation code obtained in step 2).
The application asks for documents, and asks for supplemental services:
- Delux menu +10% per person
- Afternoon breakfast +5 % per person
- Wine ad dinner +5% per day
Every supplement that the customer wants is registered on their card. The card is personal but they are tied to the same account: 1 account per room.
The application release a special card (a code) that the customers can use during the holiday to pay extras and to use the included facilities. 

## 4) Life in the hotel
Every time the customer buys something in the hotel they pay with the card.
The card tracks the customer during the holiday and calculate expenses. The customer during the holiday can ask the software their current situation to know how much they are spending and what did they do.
If one of the customer spend more than 1000 euro in a week the system notify the customer.
There are some special rules to charge correctly the customers:
- The first three drinks are free of charge
- One show per week is free
- One sport lesson is free (to choose from tennis, sailing, swimming)

## 5) Check-out process
The application prepare the full details of the holiday: expenses at the bar, sports, shows, etc..
The customer pays (remember that they already pays 30% of the initial amount).
When the customer has paid the cards are disabled and cannot be used to pay.

