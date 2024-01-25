Feature: MCheckout Partner Endpoints

  Background:
    * def partnerUrl = 'https://api.test.miles-and-more.com/payments/v3/partner'
    * configure headers = {'Authorization': 'Basic ckRyOGFSM25kV0Fib2o1cWJuVzhsWGpBZm5zZkdjd0w6MENmeE1zTzNSWUsxRXk1OA=='}

    * def earnTotalFundsJsonBody = {"transactionType":"STANDARD","authType":"MCONNECT","sessionTimeout":600,"countryCode":"DE","currency":"EUR","paymentMethod":"EARN","preselectedPaymentMethod":"EARN","externalOrderId":"LH Global","items":[],"email":"shopper@tallence.com","shopperFirstName":"Laos","shopperLastName":"Chaos","mmCardNumber":"992006413191831","totalFunds":"50000","totalMiles":0,"shippingCostsFunds":"0","returnToShopUrl":"http://localhost:8080/ws/mmTransConfirmed?ref=bGNyLTA="}
    * def earnMilesJsonBody = {"transactionType":"STANDARD","authType":"MCONNECT","sessionTimeout":600,"countryCode":"DE","currency":"EUR","paymentMethod":"EARN","preselectedPaymentMethod":"EARN","externalOrderId":"LH_Globales","items":[],"email":"shopper@tallence.com","shopperFirstName":"Laos","shopperLastName":"Chaos","earnDate":"2023-08-30T07:30:00Z","preadvice":false,"mmCardNumber":"992006413191831","totalMiles":20000,"totalFunds":"0","shippingCostsFunds":"0","returnToShopUrl":"http://localhost:8080/ws/mmTransConfirmed?ref=bGNyLTA="}

    * def authorized = 'AUTHORIZED'
    * def status = 4

  Scenario: POST EARN TOTALFUNDS TX
    Given url partnerUrl
    And request earnTotalFundsJsonBody
    When method post
    Then status 201
    And match response == { id: '#notnull'}

    Given path response.id
    When method get
    Then status 200
    And match $.status == authorized
    And match $.deltas[0].payload.status == status
    And match $.deltas[0].payload.transactionId == '#notnull'
    And print 'KDI TxID: ', response.deltas[0].payload.transactionId
