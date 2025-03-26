
  Feature: Tests for the HomePage

      Scenario: Get all tags
          Given url 'https://conduit-api.bondaracademy.com/api/tags'
          When method Get
          Then status 200

       Scenario: Get 10 articles from the page
          Given path 'api/articles'
        #  Given param limit = 10
        #  Given param offset = 0
          Given params { limit : 10 , offset : 0 }
          Given url 'https://conduit-api.bondaracademy.com/'
          When method Get
          Then status 200