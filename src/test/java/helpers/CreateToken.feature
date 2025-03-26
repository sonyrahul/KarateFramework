

  Feature: Create Token reusability
    Scenario: Create Token
      Given url 'https://conduit-api.bondaracademy.com/api/'
      Given path 'users/login'
    #  And request { "user": {"email": "rahulsony45@gmail.com","password": "Rahul@123" } }
      And request { "user": {"email": "#(email)","password": "#(pass)" } }
      When method Post
      Then status 200
      * def authToken = response.user.token
      Then print authToken