_ = require "underscore"
Promise = require "bluebird"
_3DCartBinding = require "../../lib/_3DCartBinding"
settings = (require "../../core/helper/settings")("#{process.env.ROOT_DIR}/settings/test.json")

describe "_3DCartBinding", ->
  @timeout(10000) if process.env.NOCK_BACK_MODE is "record"

  binding = null

  beforeEach ->
    binding = new _3DCartBinding({scopes: ["*"]})
    binding.setCredential(
      details: settings.credentials["_3DCart"]["Generic"]
    )

  it "binding.getOrders() :: GET /Orders @fast", ->
    new Promise (resolve, reject) ->
      nock.back "test/fixtures/_3DCartBinding/getOrders.json", (recordingDone) ->
        binding.getOrders
          offset: 0
          limit: 10
        .spread (response, body) ->
          # check body before response to make the test runner show more info in case of an error
          body.should.be.an("array")
          body.length.should.be.equal(10)
          body.should.all.have.property("OrderID")
          response.statusCode.should.be.equal(200)
        .then resolve
        .catch reject
        .finally recordingDone

#  it "binding should report rate limiting errors @ratelimit @fast", (testDone) ->
#    binding
#    testDone()
#
