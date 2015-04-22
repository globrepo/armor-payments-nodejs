Resource = require('./resource')


class Orders extends Resource

  create: (data) ->
    headers = @authenticator.secureHeaders 'post', @uri()
    @request 'post', { path: @uri(), headers: headers, body: JSON.generate(data) }

  update: (orderId, data) ->
    headers = @authenticator.secureHeaders 'post', @uri(orderId)
    @request 'post', { path: @uri(orderId), headers: headers, body: JSON.generate(data) }

  documents: (orderId) ->
    new Documents(@host, @authenticator, @uri(orderId))

  notes: (orderId) ->
    new Notes(@host, @authenticator, @uri(orderId))

  disputes: (orderId) ->
    new Disputes(@host, @authenticator, @uri(orderId))

  orderevents: (orderId) ->
    new OrderEvents(@host, @authenticator, @uri(orderId))

  paymentinstructions: (orderId) ->
    new PaymentInstructions(@host, @authenticator, @uri(orderId))

  shipments: (orderId) ->
    new Shipments(@host, @authenticator, @uri(orderId))


module.exports = Orders