Feature: Managing support call entries

  Scenario: Creating a new support contact
    Given Sally is a support user
    When she creates a new customer contact
    Then the contact should be created
    And the contact details should be displayed

