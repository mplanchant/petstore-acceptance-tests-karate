Feature: petstore test script

  Scenario: create a pet is not implemented
    Given url petstoreUrl
    And path 'pets'
    And request {"id":3,"name":"Bubbles","tag":"fish","age":1}
    When method post
    Then status 501

  Scenario: get all pets
    Given url petstoreUrl
    And path 'pets'
    When method get
    Then status 200
    And match header Content-Type == 'application/json'
    And match response[*].id contains only [1, 2]
    And match response[*].name contains only ['Fido', 'Tiddles']

  Scenario: request XML
    Given url petstoreUrl
    Given path 'pets/1'
    Given header Accept = 'application/xml'
    When method get
    Then status 406

  Scenario: update a pet is not implemented
    Given url petstoreUrl
    And path 'pets/1'
    And request {"id":1,"name":"Fido","tag":"dog","age":4}
    When method put
    Then status 405

  Scenario: find pet by ID
    Given url petstoreUrl
    Given path 'pets/1'
    When method get
    Then status 200
    And match header Content-Type == 'application/json'
    And match response.name == "Fido"
    And match response.tag == "dog"

    Given path 'pets/2'
    When method get
    Then status 200
    And match header Content-Type == 'application/json'
    And match response.name == "Tiddles"
    And match response.tag == "cat"

  Scenario: Try to find pet by ID which doesn't exist
    Given url petstoreUrl
    Given path 'pets/100'
    When method get
    Then status 404