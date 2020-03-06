Feature: petstore test script

  Scenario: get all pets
    Given url petstoreUrl
    And path 'pets'
    When method get
    Then status 200
    And match response[*].id contains only [1, 2]
    And match response[*].name contains only ['Fido', 'Tiddles']

  Scenario: find pet by ID
    Given url petstoreUrl
    Given path 'pets/1'
    When method get
    Then status 200
    And match response.name == "Fido"
    And match response.tag == "dog"

    Given path 'pets/2'
    When method get
    Then status 200
    And match response.name == "Tiddles"
    And match response.tag == "cat"

  Scenario: Try to find pet by ID which doesn't exist
    Given url petstoreUrl
    Given path 'pets/100'
    When method get
    Then status 404