Feature: Create a new contact

  Scenario: Creating a new premium customer account
    Given I am on the home page
    When I click on the "Customers" icon
    And I click on "Accounts"
    And I click "New"
    When I enter "Ritchie Rich" in the "Full Name" field
    And I enter "ritchie@is.rich.com" in the "Email" field
    And I enter "10 Rich Street, Cashville" in the Address field
    And I enter "USA" in the Country field
    And I select "Premium" in the customer type dropdown
    And I click on "Create"
    Then the customer should be created
    And the customer details should be displayed
    When the cusomer logs on
    Then the Premium Welcome Page should be displayed


