Feature: Booking a hotel

  Scenario: Choosing a hotel
    Given the user logs in as: sam.user@db.com
    And the user navigates to Plan My Trip
    And the user clicks on 'Hotels'
    When the user enters 'Mumbai' in the city field
    And the user clicks on 'Search'
    Then verify that only hotels in Mumbai are shown
    And verify that only hotels with availability on the requested dates are shown
    When the user clicks on the first hotel
    Then verify that if the hotel is out of policy then a message should be displayed
    And verify that if the hotel is not out of policy then the hotel should be allowed


Give enough information to understand the scenario intent
Do not bind the solution to a specific UI or implementation
