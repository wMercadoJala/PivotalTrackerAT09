@smoke
Feature: Smoke test of Create, Read, Update and Delete Projects

  Scenario: Read a user's projects
    Given I set up a "GET" request to "/projects" endpoint
    When I send the request
    Then I get a "200" status code as response


  @get_id_account
  Scenario: Read a user's projects with the same account_id
    Given I set up a "GET" request to "/projects?account_ids={account_id}" endpoint
    When I send the request
    Then I get a "200" status code as response


  @delete_project
  Scenario: Create a new empty project
    Given I set up a "POST" request to "/projects" endpoint
    And I set up the data:
    """
      {
        "name":"Project Test"
      }
      """
    When I send the request
    Then I get a "200" status code as response


  @create_project @delete_project
  Scenario: Read the content of a specific project
    Given I set up a "GET" request to "/projects/{proj_id}" endpoint
    When I send the request
    Then I get a "200" status code as response


  @create_project @delete_project
  Scenario: Update the specific project
    Given I set up a "PUT" request to "/projects/{proj_id}" endpoint
    And I set up the data:
    """
      {
        "name":"Change Project Name"
      }
      """
    When I send the request
    Then I get a "200" status code as response


  @create_project
  Scenario: Delete a specific project
    Given I set up a "DELETE" request to "/projects/{proj_id}" endpoint
    When I send the request
    Then I get a "204" status code as response
