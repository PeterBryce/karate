Feature: sample karate test script
  for help, see: https://github.com/karatelabs/karate/wiki/IDE-Support

  Background:
    * def partnerUrl = 'https://api.test.miles-and-more.com/payments/v3/partner'
    * def earnJsonBody = {"transactionType":"STANDARD","authType":"MCONNECT","sessionTimeout":600,"countryCode":"DE","currency":"EUR","paymentMethod":"EARN","preselectedPaymentMethod":"EARN","externalOrderId":"LH Global","items":[],"email":"shopper@tallence.com","shopperFirstName":"Laos","shopperLastName":"Chaos","mmCardNumber":"992006413191831","totalFunds":"50000","totalMiles":0,"shippingCostsFunds":"0","returnToShopUrl":"http://localhost:8080/ws/mmTransConfirmed?ref=bGNyLTA="}
    * configure headers = {'Authorization': 'Basic ckRyOGFSM25kV0Fib2o1cWJuVzhsWGpBZm5zZkdjd0w6MENmeE1zTzNSWUsxRXk1OA=='}


  Scenario: post earn Tx
    Given url partnerUrl
    And request earnJsonBody
    When method post
    Then status 201
    And match response == { id: '#notnull'}
