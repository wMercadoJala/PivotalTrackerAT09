# Created by Areliez at 4/18/2019
Feature: Create a account membership

  @smoke @create_account
  Scenario: Create a membership for a account
    Given I set up a "POST" request to "/accounts/{id}/memberships" endpoint
    And I set up the data
    """
    {
      "email":"dooku@example.com",
      "initials":"CD",
      "name":"Count Dooku"
    }
    """
    When I send the request
    Then I get a "200" status code as response