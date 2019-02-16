Feature: Daily summary reporting
  Daily summaries should be generated for the previous business day.

  Scenario Outline: Daily summaries should be generated for the previous business day
    Given the following calendar dates in 2018:
      | Date        | 11-04 | 12-04 | 13-04 | 14-04 | 15-04 | 16-04 | 17-04 | 18-04 |
      | Day         | Tur   | Fri   | Sat   | Sun   | Mon   | Tues  | Wed   | Thur  |
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
      | 18-04          | 16-04          | Working day after a holiday day |