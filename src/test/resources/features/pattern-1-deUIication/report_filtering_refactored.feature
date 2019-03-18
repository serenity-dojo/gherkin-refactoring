Feature: Report Filtering

  Users can export a summary of financial results for different clients and countries.

  Scenario: Filtering by client type
    Given Reg is a Report Manager
    And the system has financial data for following clients:
      | Name                | Business Type  |
      | Accountants R Us    | Large Business |
      | Greg the Gardener   | Small Business |
      | Annie's Accessories | Small Business |
    When Reg filters the financial data by:
      | Business Type | Large Business |
    And Reg exports the financial summaries for the filtered clients.
    Then the exported financial summary report should contain results for the following clients:
      | Greg the Gardener   | Small Business |
      | Annie's Accessories | Small Business |

  Scenario: Filtering by client type and country
    Given Reg is a Report Manager
    And the system has financial data for following clients:
      | Name                | Business Type  | Country |
      | Accountants R Us    | Large Business | UK      |
      | Greg the Gardener   | Small Business | Germany |
      | Annie's Accessories | Small Business | France  |
    When Reg filters the financial data by:
      | Business Type | Large Business |
    | Country       | Germany        |
    And Reg exports the financial summaries for the filtered clients.
    Then the exported financial summary report should contain results for the following clients:
      | Greg the Gardener   | Small Business | Germany |
