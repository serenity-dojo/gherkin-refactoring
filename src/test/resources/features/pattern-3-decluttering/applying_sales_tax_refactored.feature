Feature: Sales tax
  Add the correct amount of sales tax to new purchase orders

  Background:
    Given the following tax rates:
      | Product | Tax Category | Tax Rate |
      | Beer    | Standard     | 20%      |
      | Bananas | Reduced      | 5%       |
      | Bread   | Exempt       | 0%       |

  Scenario Outline: Adding sales tax
    Given the following order is received:
      | Product   | Unit Cost   | Quantity   | Net Cost   |
      | <Product> | <Unit Cost> | <Quantity> | <Net Cost> |
    When sales tax is calculated
    Then the updated purchase order should include:
      | Product   | Net Cost   | Tax Category   | Tax Rate   | Total   |
      | <Product> | <Net Cost> | <Tax Category> | <Tax Rate> | <Total> |
    Examples:
      | Product | Unit Cost | Quantity | Net Cost | Tax Category | Tax Rate | Total |
      | Beer    | 20        | 1        | 20       | Standard     | 20%      | 12    |
      | Bananas | 0.50      | 20       | 10       | Reduced      | 5%       | 10.50 |
      | Bread   | 2.5       | 2        | 5        | Exempt       | 0%       | 5     |
