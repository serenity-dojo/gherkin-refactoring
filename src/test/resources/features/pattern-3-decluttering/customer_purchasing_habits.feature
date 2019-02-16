Feature: Customer purchasing habits
  Customer purchase history should be recorded by category and by sub-category.

  Scenario: Customer orders a book
    Given the following order is received:
      | Order ID | Order Date | Customer ID | Product   | Product Code | Product Category | Product Subcategory | Unit Cost | Quantity | Net Cost |
      | 1001     | 2019-04-15 | 2345234     | Moby Dick | 34534534     | Zoology          | Whales              | 10        | 1        | 10       |
    When the customer interests are recorded
    Then the customer interests for this customer should include the following:
      | Customer ID | Interest | Interest Type | Score |
      | 2345234     | Zoology  | General       | 1     |
      | 2345234     | Whales   | Speciality    | 1     |

  Scenario: Customer orders several books
    Given the following orders are received:
      | Order ID | Order Date | Customer ID | Product            | Product Code | Product Category | Product Subcategory | Unit Cost | Quantity | Net Cost |
      | 1001     | 2019-04-15 | 2345234     | Moby Dick          | 34534534     | Zoology          | Whales              | 10        | 1        | 10       |
      | 1001     | 2019-04-15 | 2345234     | Whales for Dummies | 45645645     | Zoology          | Whales              | 20        | 1        | 20       |
    When the customer interests are recorded
    Then the customer interests for this customer should include the following:
      | Customer ID | Interest | Interest Type | Score |
      | 2345234     | Zoology  | General       | 2     |
      | 2345234     | Whales   | Speciality    | 2     |

  Scenario: Customer orders several different books
    Given the following orders are received:
      | Order ID | Order Date | Customer ID | Product            | Product Code | Product Category | Product Subcategory | Unit Cost | Quantity | Net Cost |
      | 1001     | 2019-04-15 | 2345234     | Moby Dick          | 34534534     | Zoology          | Whales              | 10        | 1        | 10       |
      | 1001     | 2019-04-15 | 2345234     | Whales for Dummies | 45645645     | Zoology          | Whales              | 20        | 1        | 20       |
      | 1001     | 2019-04-15 | 2345234     | Butterfly Basic    | 58567566     | Zoology          | Butterflies         | 20        | 1        | 20       |
    When the customer interests are recorded
    Then the customer interests for this customer should include the following:
      | Customer ID | Interest    | Interest Type | Score |
      | 2345234     | Zoology     | General       | 3     |
      | 2345234     | Whales      | Speciality    | 2     |
      | 2345234     | Butterflies | Speciality    | 1     |