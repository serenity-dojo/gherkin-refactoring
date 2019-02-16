# Pattern 2: Regrouping

Many feature files have a number of very similar scenarios which are in fact all examples of the same business rule. For example, consider the following scenarios:

```gherkin
  Scenario: View my tasks as an analyst
    Given I am logged in as an Application Support user
    When I navigate to the Tasks Dashboard screen
    Then I should see the My Tasks tab

  Scenario: View my tasks as a supervisor
    Given I am logged in as a Supervisor
    When I navigate to the Tasks Dashboard screen
    Then I should see the My Tasks tab
    And I should see the Team Tasks tab
    And I should see the Overdue Tasks tab

  Scenario: View my tasks as a manager
    Given I am logged in as a manger
    When I navigate to the Tasks Dashboard screen
    Then I should see the My Tasks tab
    And I should see the Open Tasks tab
    And I should see the Overdue Tasks tab
    And I should see the Completed Tasks tab
```

These scenarios would be clearer and more concise if the were grouped together as shown here:

```gherkin
  Scenario Outline: Tasks visible for different users
  Different users can see different tasks based on their roles

    Given <User> is a <Role>
    When <User> views the Tasks Dashboard
    Then they should see <Visible Tasks>
    Examples:
      | User    | Role       | Visible Tasks                              |
      | anna    | Analyst    | My Tasks                                   |
      | sam     | Supervisor | My Tasks, Team Tasks, Overdue Tasks        |
      | melissa | Manager    | Open Tasks, Overdue Tasks, Completed Tasks |
```

## Exercises

* **Exercise 1:** Refactor the [Earning Air Miles](earning_air_miles.feature) feature using the Regrouping pattern.

* **Exercise 2:** Refactor the [Daily Summary Reporting](daily_summary_reporting.feature) feature using the Regrouping pattern.

* **Exercise 3:** Refactor the [Expenses Breach Report](expenses_breach_reports.feature) feature using the Regrouping pattern.