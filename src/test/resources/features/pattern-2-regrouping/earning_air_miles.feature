Feature: Earning Air Miles
  Travellers with a higher tier card earn bonuses on their air miles

  Scenario: Blue tier members earn standard Frequent Flyer points
    Given Belinda is a Bronze tier member
    When she completes a flight worth 1000 Frequent Flyer points
    Then she should earn 1000 Frequent Flyer points

  Scenario: Bronze tier members earn a 25% bonus
    Given Bronwyn is a Bronze tier member
    When she completes a flight worth 1000 Frequent Flyer points
    Then she should earn 1250 Frequent Flyer points

  Scenario: Silver tier members earn a 50% bonus
    Given Silvia is a Silver tier member
    When she completes a flight worth 1000 Frequent Flyer points
    Then she should earn 1500 Frequent Flyer points

  Scenario: Gold tier members earn a 100% bonus
    Given Gordan is a Gold tier member
    When she completes a flight worth 1000 Frequent Flyer points
    Then she should earn 2000 Frequent Flyer points
