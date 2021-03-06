@smoke @stories
Feature: Smoke tests for stories with create and read

  Scenario: Create a new stories by id of project
    Given I set up a "POST" request to "/projects/{proj_id}/stories" endpoint
    And I set up the data:
      """
        {
         "name": "Exhaust ports are ray shielded 👹"
        }
      """
    When I send the request
    Then I get a "200" status code as response

  @create_stories
  Scenario: Read the content of Stories of a specific project
    Given I set up a "GET" request to "/projects/{proj_id}/stories/bulk" endpoint
    And I configure the "ids" with the values "{story_id}"
    When I send the request
    Then I get a "200" status code as response
    And I verify all stories schema

  @create_stories
  Scenario: Read the content all Stories of a specific project
    Given I set up a "GET" request to "/projects/{proj_id}/stories" endpoint
    When I send the request
    Then I get a "200" status code as response