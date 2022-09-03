Feature: Spartan Rest API : get spartan test

  Background:
    Given url spartan_base_url

  Scenario: Get all spartans
    Given header Accept = "application/json"
    And path "/spartans"
    When method GET
    Then status 200
    And match header Content-Type == "application/json"
    And print "Hello, and good bye"
    And print response

  Scenario: Get single spartan and verify data
    Given header Accept = "application/json"
    And path "/spartans/", 2
    When method GET
    Then status 200
    And match header Content-Type == "application/json"
    And match response.id == 2
    And match response.name == "Nels"
    And match response.gender == "Male"
    And match response.phone == 4218971348
    And match response == {id:2, name:"Nels", gender:"Male", phone:4218971348}
    * def spartanId = response.id
    * print "spartan ID = " , spartanId
    * match spartanId == 2