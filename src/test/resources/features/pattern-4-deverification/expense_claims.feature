Feature: Expense Claims

  New expense claims should be created in the Submitted state and be appear in the "New Claims" screen.

  Scenario: Submitting an expense claim
    Given I log in as: sam.user@db.com
    And I click on the "My Expenses " tab
    When I click on "New Claim"
    And I enter the description ‘Hotel expenses’
    And I enter "25-04-2019" in the Date field
    And I upload a PDF receipt for the hotel
    And I enter 3 in the nights field
    And I enter $600 in the accommodation field
    And I enter $120 in the food field
    And I upload a PDF receipt for the taxi
    And I enter $45 in the transport field
    And I click on ‘Submit’
    Then verify that the expense claim is created correctly with the correct total claims
    And check that the appropriate users can see the new claim


  Scenario: Submitting an expense claim that exceeds the $50 daily threshold
    Given I log in as: sam.user@db.com
    And I click on the "My Expenses " tab
    When I click on "New Claim"
    And I enter the description ‘Hotel expenses’
    And I enter "25-04-2019" in the Date field
    And I upload a PDF receipt for the hotel
    And I enter 3 in the nights field
    And I enter $600 in the accommodation field
    And I enter $180 in the food field
    And I click on ‘Submit’
    Then verify that the expense claim is rejected
    And check that the correct error message is displayed
