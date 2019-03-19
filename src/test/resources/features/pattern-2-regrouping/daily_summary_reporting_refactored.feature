Feature: Daily summary reporting

  Scenario Outline: Daily summaries should be generated for the previous business day
    Given the following calendar dates in  2018
      | Date        | 11-04 | 12-04 | 13-04 | 14-04 | 15-04 | 16-04 | 17-04 | 18-04 |
      | Day         | Thur  | Fri   | Sat   | Sun   | Mon   | Tues  | Wed   | Thur  |
      | Working Day | Yes   | Yes   | No    | No    | Yes   | Yes   | No    | Yes   |
    When a report is generated on <Date-Generated>
    Then the effective date should be <Date-of-Report>
    Examples:
      | Date-Generated | Date-of-Report | Comments                        |
      | 12-04          | 11-04          | Normal working day              |
      | 13-04          | 12-04          | Weekend                         |
      | 14-04          | 12-04          | Weekend                         |
      | 15-04          | 12-04          | Day after a weekend             |
      | 16-04          | 15-04          | Working day after a working day |
      | 17-04          | 16-04          | Holiday after a working day     |
      | 18-04          | 16-04          | Working day after a holiday     |

  Scenario: A daily summary generated on a normal week day
    Given the date is Friday 2018-04-12
    And  Thursday 2018-04-11 is not a public holiday
    When the daily summary report is generated
    Then the report should be generated for Thursday 2018-04-11

  Scenario: A daily summary generated on a weekend
    Given the date is Saturday 2018-04-13
    And  Friday 2018-04-12 is not a public holiday
    When the daily summary report is generated
    Then the report should be generated for Friday 2018-04-12

  Scenario: A daily summary generated on a Monday following normal weekend
    Given the date is Monday 2018-04-15
    When the daily summary report is generated
    Then the report should be generated for Friday 2018-04-12

  Scenario: A daily summary generated on a public holiday
    Given the date is Wednesday 2019-04-17
    And Wednesday 2019-04-17 is a public holiday
    When the daily summary report is generated
    Then the report should be generated for Tuesday 2019-04-16

  Scenario: A daily summary generated on a day following a public holiday
    Given the date is Thursday 2019-04-18
    And Wednesday 2019-04-17 is a public holiday
    When the daily summary report is generated
    Then the report should be generated for Tuesday 2019-04-16
