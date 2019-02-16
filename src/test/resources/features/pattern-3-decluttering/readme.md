# Pattern 3: Decluttering

Sometimes scenarios contain more information than they need to illustrate the business rule they are describing. 
They provide details that are irrelevant to the scenarios, and which mask the key details that are important to understanding the business logic.
There might be irrelevant columns in a table, irrelevent steps, or multiple scenarios that could be combined into a single scenario.

For example:

```gherkin
Scenario: Purchase order approvals
    Given the following purchase order is received:
      | Purchaser ID | Order ID | Order Date | Customer ID | Product | Product Code | Cost Center | Unit Cost | Quantity | Cost |
      | 101          | 34342    | 2019-04-15 | 2345234     | Paper   | 3423423      | 1234        | 50        | 30       | 1500 |
    When the total cost is over $1500 
    And the purchaser is a Level 1 employee
    Then the order should be submitted for approval
```

This scenario gives both too much detail (most of the data in the purchase order is irrelevant) 
and not enough (we are not told the thresholds for other emoloyee levels). 

_Decluttering_ is when you remove any information that is not relevant to illustrating the business rul in question.
For example, this rule could be better summarised with less data, as shown below:

```gherkin
Scenario: Purchase order approvals

    Given Warren is a <Level> emloyee
    When he submits a purchase order with a total cost of <Cost>
    Then his order should be <Order Action>
    Examples:
      | Level   | Cost  | Order Action            | Notes                                       |
      | Level 1 | 1000  | Approved                |                                             |
      | Level 1 | 1500  | Submitted for approved  | Threshold for Level 1 employees is 1500     |
      | Level 2 | 1500  | Approved                |                                             |
      | Level 2 | 5000  | Submitted for approved  | Threshold for Level 2 employees is 5000     |
      | Level 3 | 10000 | Approved                | There is no threshold for Level 3 employees |
```

## Exercises

* **Exercise 1:** Refactor the [Customer Purchasing Habits](customer_purchasing_habits.feature) feature using the Decluttering pattern.

* **Exercise 2:** Refactor the [Applying Sales Tax](applying_sales_tax.feature) feature using the Decluttering pattern.

