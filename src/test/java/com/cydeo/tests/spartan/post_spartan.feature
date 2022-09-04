Feature: Add new spartan

  Background:
  * url spartan_base_url

  Scenario: Post new spartan
    Given header Content-Type = "application/json"
    And header Accept = "application/json"

    #set json body of request
    And request {name : "karate" , gender : "Male" , phone : 1232311234}
    And path "/spartans"
    When method POST
    Then status 201
    And match response.data.id == '#number'
    * def successMsg = response.success
    * print "message = " , successMsg
    And assert successMsg == "A Spartan is Born!"
    And assert response.data.name == "karate"
    * def newSpartanId = response.data.id
    * print "newSpartanId = " , newSpartanId

    #send GET request to /spartans/newSpartanId
    Given header Accept = "application/json"
    And path "/spartans" , newSpartanId
    When method GET
    Then status 200
    And match response == {id : '#(newSpartanId)' ,name : "karate" , gender : "Male" , phone : 1232311234}

    #delete newly created spartan using newSpartanId
    Given path "/spartans" , newSpartanId
    Then method DELETE
    Then status 204