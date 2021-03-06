_ = require "underscore"
helper = require "../../core/helper/model"

module.exports = (bookshelf) ->
  bookshelf.Model.extend
    tableName: "_3DCartOrders"
    hasTimestamps: ['_createdAt', '_updatedAt']
  ,
    _.extend helper(bookshelf),
      buildTable: (table) ->
        table.increments()
        table.string("InvoiceNumberPrefix").nullable()
        table.integer("InvoiceNumber").nullable()
        table.integer("OrderStatusID").nullable()
        table.integer("CustomerID").nullable()
        table.string("UserID").nullable()
        table.string("SalesPerson").nullable()
        table.string("BillingFirstName").nullable()
        table.string("BillingLastName").nullable()
        table.string("BillingCompany").nullable()
        table.string("BillingAddress").nullable()
        table.string("BillingAddress2").nullable()
        table.string("BillingCity").nullable()
        table.string("BillingState").nullable()
        table.string("BillingZipCode").nullable()
        table.string("BillingCountry").nullable()
        table.string("BillingPhoneNumber").nullable()
        table.string("BillingEmail").nullable()
        table.string("BillingPaymentMethod").nullable()
        table.boolean("BillingOnLinePayment").notNullable()
        table.string("BillingPaymentMethodID").nullable()
        table.decimal("OrderDiscount", 10, 2).defaultTo(0)
        table.decimal("SalesTax", 10, 2).defaultTo(0)
        table.decimal("SalesTax2", 10, 2).defaultTo(0)
        table.decimal("SalesTax3", 10, 2).defaultTo(0)
        table.decimal("OrderAmount", 10, 2).defaultTo(0)
        table.decimal("AffiliateCommission", 10, 2).defaultTo(0)
        table.string("CardType").nullable()
        table.string("CardNumber").nullable()
        table.string("CardName").nullable()
        table.string("CardExpirationMonth").nullable()
        table.string("CardExpirationYear").nullable()
        table.string("CardIssueNumber").nullable()
        table.string("CardStartMonth").nullable()
        table.string("CardStartYear").nullable()
        table.string("CardAddress").nullable()
        table.string("CardVerification").nullable()
        table.string("RewardPoints").nullable()
        table.text("Referer").nullable()
        table.string("IP").nullable()
        table.string("ContinueURL").nullable()
        table.text("CustomerComments").nullable()
        table.text("InternalComments").nullable()
        table.text("ExternalComments").nullable()
        table.specificType("ShipmentList", "jsonb[]").nullable() # simple jsonb() wouldn't suffice, because the field is actually an array
        table.specificType("OrderItemList", "jsonb[]").nullable()
        table.specificType("TransactionList", "jsonb[]").nullable()
        table.specificType("QuestionList", "jsonb[]").nullable()
        table.dateTime("OrderDate").notNullable()  # native 3DCart _createdAt
        table.dateTime("LastUpdate").notNullable()  # native 3DCart _updatedAt
        table.bigInteger("_uid").notNullable().unsigned() # native 3DCart id
        table.string("_avatarId").notNullable()
        table.dateTime("_createdAt").notNullable()
        table.dateTime("_updatedAt").notNullable()
        table.unique(["_uid", "_avatarId"], "_3dcartorders__uid__avatarid_unique") # index name is optional; it's added here as workaround for a number "3" in the beginning of index name
