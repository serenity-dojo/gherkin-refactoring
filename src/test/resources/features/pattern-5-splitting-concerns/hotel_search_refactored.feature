Feature: Booking a hotel

  Background:
    Given Tracy is a traveller booking a trip on the in-house travel booking system

  Scenario: Find a hotel by city
    Given the following hotels are registered in the booking system
      | Hotel         | City   |
      | City Plaza    | Pune   |
      | Hilton Garden | Mumbai |
      | Conrad Resort | Mumbai |
    When Tracy searches for hotels matching the following criteria
      | City | Mumbai |
    Then the following hotels should be listed:
      | Hotel         | City   |
      | Hilton Garden | Mumbai |
      | Conrad Resort | Mumbai |

  Scenario: Hotels that are out of policy should be shown with a warning
    Given the maximum room rate for Mumbai is 8000
    And the following hotels are registered in the booking system
      | Hotel         | City   | Room rate |
      | City Plaza    | Pune   | 3000      |
      | Hilton Garden | Mumbai | 7000      |
      | Conrad Resort | Mumbai | 12000     |
    When Tracy searches for hotels matching the following criteria
      | City | Mumbai |
    Then the following hotels should be listed:
      | Hotel         | City   | In Policy | Allowed |
      | Hilton Garden | Mumbai | Yes       | Yes     |
      | Conrad Resort | Mumbai | No        | No      |
