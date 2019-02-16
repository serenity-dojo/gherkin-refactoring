Feature: Create a new contact

  Scenario: Creating a new premium customer account
    Given Sally is a support user
    And Ritchie is a premium client
    When she creates a new Premium account for Ritchie
    And Ritchie accesses his accounts
    Then Ritchie should be taken to the Premium Welcome Page

