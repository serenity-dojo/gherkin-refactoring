Feature: Customer purchasing habits
  Customer purchase history should be recorded by category and by sub-category.

  Scenario: Customer orders books on a given topic
    Given Carrie has placed orders for the following products:
      | Product   | Product Category | Product Subcategory | Quantity |
      | Moby Dick | Zoology          | Whales              | 1        |
    When her order is processed
    Then her interested should be recorded as follows:
      | Interest | Interest Type | Score |
      | Zoology  | General       | 1     |
      | Whales   | Speciality    | 1     |

  Scenario: Customer orders books on different related topic
    Given Carrie has placed orders for the following products:
      | Product            | Product Category | Product Subcategory | Quantity |
      | Moby Dick          | Zoology          | Whales              | 1        |
      | Whales for Dummies | Zoology          | Whales for Dummies  | 1        |
      | Butterfly Basic    | Zoology          | Butterflies         | 1        |
    When her order is processed
    Then her interested should be recorded as follows:
      | Interest    | Interest Type | Score |
      | Zoology     | General       | 3     |
      | Whales      | Speciality    | 2     |
      | Butterflies | Speciality    | 1     |
