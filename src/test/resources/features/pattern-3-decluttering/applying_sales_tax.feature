Feature: Sales tax
  Add the correct amount of sales tax to new purchase orders

  Scenario: Standard sales tax is 20%
    Given the following order is received:
      | Order ID | Order Date | Customer ID | Product | Product Code | Unit Cost | Quantity | Net Cost |
      | 1001     | 2019-04-15 | 2345234     | Beer    | 3423423      | 20        | 1        | 20       |
    When sales tax is calculated
    Then the updated purchase order should be:
      | Order ID | Order Date | Customer ID | Product | Product Code | Unit Cost | Quantity | Net Cost | Tax Category | Tax Rate | Total |
      | 1001     | 2019-04-15 | 2345234     | Beer    | 3423423      | 20        | 1        | 20       | Standard     | 20%      | 12    |

  Scenario: Reduced sales tax is 5%
    Given the following order is received:
      | Order ID | Order Date | Customer ID | Product | Product Code | Unit Cost | Quantity | Net Cost |
      | 1002     | 2019-04-15 | 2345234     | Bananas | 45645645     | 20        | 1        | 20       |
    When sales tax is calculated
    Then the updated purchase order should be:
      | Order ID | Order Date | Customer ID | Product | Product Code | Unit Cost | Quantity | Net Cost | Tax Category | Tax Rate | Total |
      | 1002     | 2019-04-15 | 2345234     | Bananas | 45645645     | 0.5       | 20       | 10       | Reduced      | 5%       | 10.50 |

  Scenario: Exempt sales tax is 0%
    Given the following order is received:
      | Order ID | Order Date | Customer ID | Product | Product Code | Unit Cost | Quantity | Net Cost |
      | 1002     | 2019-04-15 | 2345234     | Bread   | 4645645      | 2.5       | 2        | 5        |
    When sales tax is calculated
    Then the updated purchase order should be:
      | Order ID | Order Date | Customer ID | Product | Product Code | Unit Cost | Quantity | Net Cost | Tax Category | Tax Rate | Total |
      | 1002     | 2019-04-15 | 2345234     | Bananas | 4645645      | 2.5       | 2        | 5        | Exempt       | 0%       | 5     |
