Feature: Teacher user get info

  Background:
    * url bookit_base_url

  Scenario: Teacher user get info "/api/user/me"
    #call login.feature fille and store response to login variable
    * def login = call read('login.feature')
    #get access token and print value out
    * print "access token = ", login.accessToken
    Given header Accept = "application/json"
    And header Authorization = login.accessToken
    And path "/api/users/me"
    When method GET
    Then status 200
    And match response.role == "teacher"