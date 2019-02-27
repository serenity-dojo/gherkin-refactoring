# Pattern 5: Splitting Concerns

Some scenarios contain checks for several distinct business rules. 
This makes them harder to maintain and harder to troubleshoot when they fail.
Any given scenario should have a single business reason to fail.

For example:

```gherkin
Scenario: Choosing a hotel
  Given the user logs in as: sam.user@db.com   
  And the user navigates to Plan My Trip 
  And the user clicks on 'Hotels'
  When the user enters 'Mumbai' in the city field
  And the user clicks on 'Search'
  Then verify that only hotels in Mumbai are shown
  When the user clicks on the first hotel
  Then verify that if the hotel is out of policy then a message should be displayed
  And verify that if the hotel is not out of policy then the hotel should be allowed
```

_Deverification_ is the process of turning instructions to a tester into declarative descriptions. 
A more declarative version might look like this:

```gherkin
Background:
  Given Sam is a level 1 analyst
  And Mandy is a level 2 analyst

Scenario: Escalating a KYC review
  Given that Sam has been assigned the following reviews:
    | customer        | status  | 
    | Alistair Capone | pending | 
    | Bonnie Clyde    | pending | 
  When Sam escalates the review for Bonnie Clyde 
    with the comment ‘looks dodgy’
  Then Sam’s review list should contain:
    | customer        | status  | 
    | Alistair Capone | pending | 
  And Mandy’s review list should contain:
    | customer     | status    | comment     |
    | Bonnie Clyde | escalated | looks dodgy |
```

## Exercises

* **Exercise 1:** Refactor the [Expense Claims](expense_claims.feature) feature using the _Deverification_ pattern.
