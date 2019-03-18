Feature: Creating new contacts

  Scenario: Creating a new customer contact
    Given Sally is a support user
    When she creates a new premium customer contact
    Then the contact should be created
    And the contact details should be displayed

  Scenario: Premium customers have access to the Premium Welcome Page
    Given Sally is a support user
    And Priya is a premium customer
    And Sally has created a premium customer contact for Priya
    When Priya accesses her account
    Then she should be taken to the Premium Welcome Page
