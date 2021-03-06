@issues_epic
Feature: Issues test for Epic and Epics for Post and Put

  @create_project @delete_project
  Scenario: Create a new Epic with name, empty description and numeral name label.
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
    "description":"",
    "label":{
              "name":123
            },
    "name":"epic"
    }
    """
    When I send the request
    Then I get a "400" status code as response


@create_project @delete_project
  Scenario: Create a new Epic with name, empty description and array name label.
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
    "description":"",
    "label":{
              "name": ["XML", "GML"]
            },
    "name":"epic"
    }
    """
    When I send the request
    Then I get a "400" status code as response


  @create_epic @delete_project
  Scenario: Create a new Epic with numerical label related to after Epic
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "after_id":{epic_id},
      "label": {
                  "name": 123
               },
      "name":"Project Epic"
    }
    """
    When I send the request
    Then I get a "400" status code as response


  @create_epic @delete_project
  Scenario: Create a new Epic with brackets name label related to after Epic
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "after_id":{epic_id},
      "label": {
                  "name": ["XML", "GML"]
               },
      "name":"Project Epic"
    }
    """
    When I send the request
    Then I get a "400" status code as response


  @create_epic @delete_project
  Scenario: Create a new Epic with brackets name label related to before Epic
    Given I set up a "POST" request to "/projects/{proj_id}/epics" endpoint
    And I set up the data
    """
    {
      "before_id":{epic_id},
      "label": {
                  "name": ["XML", "GML"]
               },
      "name":"Project Epic"
    }
    """
    When I send the request
    Then I get a "400" status code as response


    @create_epic @delete_project
  Scenario: Update an Epic with the brackets label name
    Given I set up a "PUT" request to "/projects/{proj_id}/epics/{epic_id}" endpoint
    And I set up the data
    """
    {
     "label": {
                  "name": ["xml"]
               },
      "name" : "Project Epic"
    }
    """
    When I send the request
    Then I get a "400" status code as response


  @create_epic @delete_project
  Scenario: Update an  Epic with the numerical label name
    Given I set up a "PUT" request to "/projects/{proj_id}/epics/{epic_id}" endpoint
    And I set up the data
    """
    {
     "label": {
                  "name": 123
               },
      "name" : "Project Epic"
    }
    """
    When I send the request
    Then I get a "400" status code as response


