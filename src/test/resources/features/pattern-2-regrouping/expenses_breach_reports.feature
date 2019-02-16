Feature: Miscellaneous expenses report
  This report highlights teams or departments with unusually high expenses that do not fall into the authorised categories.
  Each team is allowed by default up to $5000 in miscellaneous expenses, but this can be configured.
  Each department is allowed up to $25000.
  If a team or department exceeds these limits, they will appear in the report.
  The breach report should include the Team name, total expenses, miscellaneous expenses, and breach status.

  Miscellaneous expenses are the total expenses less all other assigned categories (Travel, Conferences...).

  Scenario: Teams not exceeding $5000 in miscellaneous expenses are not in breach
    Given the maximum miscellaneous expense budget per team is $5000
    And the following team expense breakdown:
      | Year | Quarter | Department | Team   | Total | Travel | Conferences | Training |
      | 2018 | 4       | Red Dept   | Team A | 1000  | 100    | 500         | 150      |
    When the expense breach report is generated
    Then Team A is not in breach

  Scenario: Teams exceeding $5000 in miscellaneous expenses are in breach
    Given the maximum miscellaneous expense budget per team is $5000
    And the following team expense breakdown:
      | Year | Quarter | Department | Team   | Total | Travel | Conferences | Training |
      | 2018 | 4       | Red Dept   | Team B | 50000 | 20000  | 10000       | 5000     |
    When the expense breach report is generated
    Then Team B is in breach

  Scenario: Departments with total miscellaneous expenses over $25000 are in breach
    Given the maximum miscellaneous expense budget per department is $25000
    And the following department expense breakdown:
      | Year | Quarter | Department | Team   | Total | Travel | Conferences | Training |
      | 2018 | 4       | Red Dept   | Team A | 10000 | 5000   | 4000        | 500      |
      | 2018 | 4       | Red Dept   | Team B | 40000 | 20000  | 10000       | 5000     |
      | 2018 | 4       | Red Dept   | Team C | 50000 | 10000  | 10000       | 5000     |
    When the expense breach report is generated
    Then Red Dept department is in breach

  Scenario: Departments with total miscellaneous expenses under $25000 are not in breach
    Given the maximum miscellaneous expense budget per department is $25000
    And the following department expense breakdown:
      | Year | Quarter | Department | Team   | Total | Travel | Conferences | Training |
      | 2018 | 4       | Blue Dept  | Team D | 20000 | 2000   | 10000       | 8000     |
      | 2018 | 4       | Blue Dept  | Team E | 50000 | 20000  | 10000       | 5000     |
    When the expense breach report is generated
    Then Blue Dept department is in breach
