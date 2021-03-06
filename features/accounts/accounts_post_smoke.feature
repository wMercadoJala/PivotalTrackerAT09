# Created by Areliez at 4/18/2019
@account
Feature: Smoke test to create an account membership

  @smoke @create_account
  Scenario: Create a membership for a account
    Given I set up a "POST" request to "/accounts/{id}/memberships" endpoint
    And I set up the data
    """
    {
      "email":"{email}",
      "initials":"{initials}",
      "name":"{name}"
    }
    """
    When I send the request
    Then I get a "200" status code as response