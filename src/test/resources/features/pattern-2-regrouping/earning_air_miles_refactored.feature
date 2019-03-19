Feature: Earning Air Miles
  Travellers with a higher tier card earn bonuses on their air miles

  Scenario Outline: Tier members earn extra Frequent Flyer points depending on their status
    Given Tierry is a <Tier> member
    When he completes a flight normally worth <Base Points> points
    Then he should earn <Earned Points> points

    Examples:
      | Tier   | Percentage Points Bonus | Base Points | Earned Points |
      | Blue   | 0                       | 1000        | 1000          |
      | Bronze | 25                      | 1000        | 1250          |
      | Silver | 50                      | 1000        | 1500          |
      | Gold   | 100                     | 1000        | 2000          |