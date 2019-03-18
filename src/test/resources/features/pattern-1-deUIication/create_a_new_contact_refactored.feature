Feature: Creating new contacts

  Scenario: Creating a new customer contact
    Given Sally is a support user
    When she creates a new customer contact
    Then the contact should be created
    And the contact details should be displayed
