# Pattern 4: Deverification

Some scenarios are written as instructions to testers, rather than as declarative descriptions of business rules and expected outcomes.
They often have words like "check that", or "verify that", or need human interpretation to know if they pass.

For example:

```gherkin
Scenario: Escalating a KYC review   
  Given the user logs in as: sam.user@db.com   
  And the user navigates to My Reviews   
  When the user opens the first review   
  And the user enters the comment ‘looks dodgy’   
  And the user clicks on ‘Escalate’
  Then check that the review list is updated correctly
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
