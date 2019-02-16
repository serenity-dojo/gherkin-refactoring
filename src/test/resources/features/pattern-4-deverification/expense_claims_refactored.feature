Feature: Expense Claims

  New expense claims should be created in the Submitted state and be appear in the "New Claims" screen.

  Background:
    Given Sam is an employee
    And Susan is an approver

  Scenario: Submitting an expense claim
    Given Sam is authorised to raise expense claims
    When Sam creates the following expense claim on 25-04-2019:
      | Date       | Description    |
      | 25-04-2019 | Hotel expenses |
    And Sam adds the following receipts:
      | Date       | Receipt   | Amount |
      | 24-04-2019 | hotel.pdf | 500    |
      | 24-04-2019 | taxi.pdf  | 50     |
    And Sam submits the claim
    Then Susan should see the following claim in the New Claims list:
      | Employee | Description    | Status    | Date       | Total claim |
      | Sam      | Hotel expenses | Submitted | 25-04-2019 | 550         |