# Pattern 5: Splitting Concerns

Some scenarios contain checks for several distinct business rules. 
This inevitably makes them difficult to read. They are also harder to maintain and harder to troubleshoot when they fail.
In fact, any given scenario should have a single business reason to fail.

For example:

```gherkin
Scenario: Booking a flight
  Given the user logs in as: sam.user@db.com   
  And the user navigates to Book My Flight
  When the user enters 'London' in the departure city and 'Mumbai' in the destination city
  And the user clicks on 'Search'
  And the user clicks on the first flight in the list
  Then verify that if the airline is not a company preferred airline than a warning is displayed
  And verify that if the price is more than 50% than the lowest price on a company-preferred airline then the trip will need senior manager approval
```

This scenario describes two business rules (preferred airlines and price policy), and could be split into two distinct scenarios:

```gherkin
Scenario: Travellers should be warned when booking flights with airlines that are not company-preferred
  Given Fresh Airways is not a company preferred airline
  And Trevor is booking a flight from London to Florida
  When Trevor selects a flight with Fresh Airways
  Then he should be warned that the airline is not company-preferred 
  
Scenario Outline: Expensive flights on company-preferred airlines need senior manager approval
  Flights more than 50% more than the cheapest flight on a company-preferred airlines
  will need senior manager approval
    
  Given Trevor is booking a flight from London to Florida
  And the following flights are available:
    | Flight | Airline         | Price | Company Preferred |
    | BA-101 | British Airways | 1600  | Yes               |
    | BA-102 | British Airways | 1400  | Yes               |
    | DT-201 | Delta           | 1000  | Yes               |
    | DA-301 | Dodgy Airlines  | 400   | No                |
  When Trevor selects flight <Flight>
  Then senior manager is required or not: <Senior Manager Approval Required>
  
  Examples:
    | Flight | Senior Manager Approval Required |
    | BA-101 | Yes                              |
    | BA-102 | No                               |
```

## Exercises

* **Exercise 1:** Refactor the [Hotel Search](hotel_search.feature) feature using the _Splitting Concerns_ pattern.
