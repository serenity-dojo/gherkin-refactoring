Feature: Create a new contact

  Scenario: Creating a new support call entry
    Given Sally is a support user
    When she creates a new customer contact
    Then the contract should be created
    And the contract details should be displayed

