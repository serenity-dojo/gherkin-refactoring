Feature: Expense Claims

  New expense claims should be created in the Submitted state and be appear in the "New Claims" screen.

  Scenario: Submitting an expense claim
    Given I log in as: sam.user@db.com
    And I click on the "My Expenses " tab
    When I click on "New Claim"
    And I enter the desription ‘Hotel expenses’
    And I enter "25-04-2019" in the Date field
    And I upload a PDF receipt for the hotel
    And I upload a PDF receipt for the taxi
    And I click on ‘Submit’
    Then verify that the expense claim is created correctly with the correct total claims
    And check that the appropriate users can see the new claim
