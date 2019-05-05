class PaymentGatewayController < ApplicationController
  include AuthorizeNet::API
  def create_transaction
    transaction = Transaction.new(ENV['AA'], ENV['AB'], :gateway => :sandbox)
    request = CreateTransactionRequest.new
    request.transactionRequest = TransactionRequestType.new()
    request.transactionRequest.amount = 125000
    request.transactionRequest.payment = PaymentType.new
    randomAccountNumber= Random.rand(100000000..9999999999).to_s;
    request.transactionRequest.payment.bankAccount = BankAccountType.new('checking','122000661',"'#{randomAccountNumber}'", 'John Doe','WEB','Wells Fargo Bank NA','101')
    request.transactionRequest.order = OrderType.new("invoiceNumber#{(SecureRandom.random_number*1000000).round(0)}","Order Description")
    response = transaction.create_transaction(request)
    response
  end
end
