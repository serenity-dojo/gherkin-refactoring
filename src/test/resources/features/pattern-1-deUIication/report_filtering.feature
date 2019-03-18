Feature: Report Filtering

  Users can export a summary of financial results for different clients and countries.

  Scenario: Filter Functionality on the Report Page
    Given Navigate to the report page
    Given apply filter on client type
    Then select "Equals" filter from select filter dropdown
    And enter the client type "Small Business" for the selected filter value and apply filter
    Then user should be able to take the export for "Small Business" clients
    When the User selects "1" record the total number of selected records should be displayed at the bottom of the page

  Scenario: Multiple Filter Functionality on the Report Page
    Given Navigate to the report page
    Given apply filter on client type
    Then select "Equals" filter from select filter dropdown
    And enter the client type "Small Business" for the selected filter value
    And select "Or" radiobutton to select another filter
    And enter the country "Germany" for the second selected filter and apply filter
    And verify the records based on the client type and country
