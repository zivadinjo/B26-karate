Feature: Google search

  Scenario: Search for SDET jobs on google
    Given driver "https://www.google.com/"
    And input('input[name=q]','SDET remote jobs')
    And click('input[name=btnK]')
    And click('div[id=hdtb-tls]')