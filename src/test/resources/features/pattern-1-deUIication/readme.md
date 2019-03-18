# Pattern 1: De-UI-ication

## Description
Cucumber scenarios are often written as imperative test scripts, tightly bound to the user interface and a very precise order of UI interactions. The following is a typical example:
 
 ```gherkin
  Scenario: Creating a new help desk ticker
    Given I am logged in as an Support user
    When I navigate to the Tickets tab
    And I click "New"
    And I select "New Ticket"
    When I fill in the mandatory fields
    And I click on "Create"
    Then I should see the ticket details page appear
    And the ticket status dropdown should show "Open"
```

Scenarios like this are fragile and hard to maintain. Small changes in the application screens can have large impacts on many scenarios. In addition, scenarios like these are hard to read and make it hard to understand the business rule being verified.
 
We can improve scenarios like these ones by making them less imperative and more declarative. _De-UI-ication_ is the process of grouping UI-steps into more declarative, business-readable steps. For example, the scenario above could be refactored as follows:
 
 ```gherkin
  Scenario: Creating a new help desk ticker
    Given Sally is a support user
    When she creates a new support ticket
    Then the ticket should be stored as an Open ticket
    And the ticket details should be displayed
 ``` 

## Exercises

* Refactor the [Create A New Contact](create_a_new_contact.feature) feature using the deUIication pattern.

* Refactor the [Create A Premium Customer Account](create_a_new_premium_customer_account.feature) feature using the deUIication pattern.

* Refactor the [Report Filtering](report_filtering.feature) feature using the deUIication pattern.
