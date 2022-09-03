
Feature: Hello world feature

  Scenario: User is able to see hello world greeting
    #Given url 'https://sandbox.api.service.nhs.uk/hello-world/hello/world'
    Given url hello_world_api_url
    When method GET
    Then status 200
    #verify message is "Hello World!"
    And match response.message == "Hello World!"
    #verify content type is "application/json; charset=UTF-8"
    And match header Content-Type == "application/json; charset=UTF-8"
    #verify header content length equals to 32
    And match header Content-Length == '32'