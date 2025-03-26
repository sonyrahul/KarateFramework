
  Feature: Articles

    Background: Define URL
      Given url 'https://conduit-api.bondaracademy.com/api/'
    #   Given path 'users/login'
    #   And request { "user": {"email": "rahulsony45@gmail.com","password": "Rahul@123" } }
    #   When method Post
    #   Then status 200
    #   * def token = response.user.token
    #   Then print token

      # To call every time when scenario will invoked
  #  * def tokenResponse = call read('classpath:helpers/CreateToken.feature')
  #  * def tokenResponse = callonce read('classpath:helpers/CreateToken.feature')
      * def tokenResponse = callonce read('classpath:helpers/CreateToken.feature') {"email": "rahulsony45@gmail.com","pass": "Rahul@123" }
    * def token = tokenResponse.authToken



    Scenario: Create a New Article
      Given header Authorization = 'Token ' + token
      Given path 'articles'
      And request {"article": {"title": "BahubaliI486","description": "Very good movie","body": "Hey Hi Dell ? How are you"}}
      When method Post
      Then status 201
      And print response
      And match response.article.title == 'BahubaliI486'

    @delete
    Scenario: Create and Delete an article
      Given header Authorization = 'Token ' + token
      Given path 'articles'
      And request {"article": {"title": "Delete Article948","description": "Very good movie","body": "Hey Hi Dell ? How are you"}}
      When method Post
      Then status 201
      * def articleID = response.article.slug
      And print articleID

      Given header Authorization = 'Token ' + token
      Given path 'articles/',articleID
      When method Delete
      Then status 204

      Given path 'articles'
      Given params { limit : 10 , offset : 0 }
      When method Get
      Then status 200
      And print response



