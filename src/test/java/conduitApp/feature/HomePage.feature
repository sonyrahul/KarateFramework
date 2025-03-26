
  Feature: Tests for the HomePage

    Background: Defined URL
          Given url 'https://conduit-api.bondaracademy.com/api/'

    @sanity
      Scenario: Get all tags
          Given path 'tags'
          When method Get
          Then status 200
          And match response.tags contains ['Bondar Academy','GitHub','YouTube']
          And match response.tags !contains 'trucks'
          And match response.tags  == '#array'
          And match each response.tags =='#string'

      @debug
       Scenario: Get 10 articles from the page
          Given path 'articles'
        #  Given param limit = 10
        #  Given param offset = 0
          Given params { limit : 10 , offset : 0 }
          When method Get
          Then status 200
          And match response.articles == '#[10]'
          And match response.articlesCount  == 10