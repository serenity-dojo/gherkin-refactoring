Feature: P&L Unexplained Report

  Summary of the unexplained breaches at book/desk level

  Scenario Outline: Unexplained breaches at the book level
  The unexplained is the difference between the daily P&L and the sum of the P&L attributions

    Given the book breach level is ABS 5000 EUR
    When the P&L attribution for book "Book 1" is as follows:
      | DTD P&L   | Delta   | Vega   | Fees   |
      | <DTD P&L> | <Delta> | <Vega> | <Fees> |
    Then the unexplained report should include:
      | Book   | Book DTD P&L | Unexplained   | Breach   |
      | Book 1 | <DTD P&L>    | <Unexplained> | <Breach> |

    Examples:
      | DTD P&L | Delta  | Vega   | Fees  | Unexplained | Breach |
      | 1000    | 100    | 500    | 150   | 250         | No     |
      | 50000   | 20000  | 10000  | 5000  | 15000       | Yes    |
      | -50000  | -20000 | -10000 | -5000 | -15000      | Yes    |

  Scenario: Unexplained breaches at the desk level within threshold
  The unexplained is the difference between the daily P&L and the sum of the P&L attributions

    Given the desk breach level is ABS 75000 EUR
    When the P&L attribution for a desk is as follows:
      | Desk   | Book   | DTD P&L | Delta | Vega  | Fees  | Unexplained | Breach |
      | Desk 1 | Book 1 | 1000    | 100   | 500   | 150   | 250         | No     |
      | Desk 1 | Book 2 | 50000   | 20000 | 10000 | 5000  | 15000       | No     |
      | Desk 1 | Book 3 | 75000   | 1000  | 2000  | 2000  | 70000       | No     |
      | Desk 1 | Book 4 | -75000  | -1000 | -2000 | -2000 | -70000      | No     |
    Then the unexplained report should include:
      | Desk   | Desk DTD P&L | Unexplained | Breach |
      | Desk 1 | 51000        | 15250       | No     |

  Scenario: Unexplained breaches at the desk level exceeding threshold
  The unexplained is the difference between the daily P&L and the sum of the P&L attributions

    Given the desk breach level is ABS 75000 EUR
    When the P&L attribution for a desk is as follows:
      | Desk   | Book   | DTD P&L | Delta | Vega  | Fees | Unexplained | Breach |
      | Desk 2 | Book 1 | 1000    | 100   | 500   | 150  | 250         | Yes    |
      | Desk 2 | Book 2 | 50000   | 20000 | 10000 | 5000 | 15000       | Yes    |
      | Desk 2 | Book 3 | 75000   | 1000  | 2000  | 2000 | 70000       | Yes    |
    Then the unexplained report should include:
      | Desk   | Desk DTD P&L | Unexplained | Breach |
      | Desk 2 | 51000        | 85250       | Yes    |

