Feature: Managing support call entries

  Scenario: Creating a new support call entry
    Given I am on the home page
    When I click on the "Customers" icon
    And I click on "Contacts"
    And I click "New"
    When I enter "Maria von Trapp" in the "Full Name" field
    And I enter "maria@von.trapp" in the "Email" field
    And I enter "10 Main Street, Trapville" in the Address field
    And I enter "Switzerland" in the Country field
    And I click on "Create"
    Then the contact should be created
    And the contact details should be displayed

