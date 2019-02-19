Feature: Expense Claims

  New expense claims should be created in the Submitted state and be appear in the "New Claims" screen.

  Background:
    Given Sam is an employee
    And Amir is an approver

  Scenario: Submitting an expense claim
    Given Sam is authorised to raise expense claims
    When Sam creates the following expense claim on 25-04-2019:
      | Date       | Description    |
      | 25-04-2019 | Hotel expenses |
    And Sam adds the following receipts:
      | Date       | Receipt   | Nights | Accomodation | Food | Transport |
      | 24-04-2019 | hotel.pdf | 3      | 600          | 120  | 0         |
      | 24-04-2019 | taxi.pdf  |        | 0            | 0    | 45        |
    And Sam submits the claim
    Then Amir should see the following claim in the New Claims list:
      | Employee | Description    | Status    | Date       | Total claim |
      | Sam      | Hotel expenses | Submitted | 25-04-2019 | 765         |

  Scenario: Submitting an expense claim that exceeds the $50 daily threshold
    Given Sam is authorised to raise expense claims
    When Sam creates the following expense claim on 25-04-2019:
      | Date       | Description    |
      | 25-04-2019 | Hotel expenses |
    And Sam adds the following receipts:
      | Date       | Receipt   | Accomodation | Food | Transport |
      | 24-04-2019 | hotel.pdf | 500          | 180  | 0         |
      | 24-04-2019 | taxi.pdf  | 0            | 0    | 45        |
    And Sam submits the claim
    Then the claim should be rejected
    And Sam should be informed that "Food expenses exceed the $50 daily threshold"