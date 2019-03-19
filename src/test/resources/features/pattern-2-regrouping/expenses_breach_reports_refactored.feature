Feature: Miscellaneous expenses report
  This report highlights teams or departments with unusually high expenses that do not fall into the authorised categories.
  Each team is allowed by default up to $5000 in miscellaneous expenses, but this can be configured.
  Each department is allowed up to $25000.
  If a team or department exceeds these limits, they will appear in the report.
  The breach report should include the Team name, total expenses, miscellaneous expenses, and breach status.

  Miscellaneous expenses are the total expenses less all other assigned categories (Travel, Conferences...).

  Scenario Outline: Miscellaneous expense breaches at the team level
    Given the maximum miscellaneous expense budget per team is $5000
    When the team expense breakdown is as follows:
      | Total   | Travel   | Conferences   | Training   |
      | <Total> | <Travel> | <Conferences> | <Training> |
    Then the miscellaneous expenses report should include:
      | Total Expenses | Miscellaneous Expenses | Breach   |
      | <Total>        | <Misc>                 | <Breach> |
    Examples:
      | Total | Travel | Conferences | Training | Misc  | Breach |
      | 1000  | 100    | 500         | 150      | 250   | No     |
      | 50000 | 20000  | 10000       | 5000     | 15000 | Yes    |


  Scenario: Miscellaneous expense breaches at the department level
    Given the maximum miscellaneous expense budget per department is $25000
    When the department expense breakdown for Red Dept is as follows:
      | Team   | Total | Travel | Conferences | Training | Miscellaneous |
      | Team A | 10000 | 5000   | 4000        | 500      | 500           |
      | Team B | 40000 | 20000  | 10000       | 5000     | 15000         |
      | Team C | 50000 | 10000  | 10000       | 5000     | 25000         |
    And the department expense breakdown for Blue Dept is as follows:
      | Team   | Total | Travel | Conferences | Training | Miscellaneous |
      | Team D | 20000 | 2000   | 10000       | 8000     | 0             |
      | Team E | 50000 | 20000  | 10000       | 5000     | 15000         |
    Then the miscellaneous expenses report should include:
      | Department | Total Expenses | Miscellaneous Expenses | Breach |
      | Red Dept   | 100000         | 40500                  | Yes    |
      | Blue Dept  | 70000          | 150000                 | No     |

