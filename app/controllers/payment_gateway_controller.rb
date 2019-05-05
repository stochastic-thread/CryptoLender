class PaymentGatewayController < ApplicationController
  include AuthorizeNet::API
  def create_transaction
    transaction = Transaction.new(ENV['AA'], ENV['AB'], :gateway => :sandbox)
    request = CreateTransactionRequest.new
    request.transactionRequest = TransactionRequestType.new()
    request.transactionRequest.amount = tx_params[:amount]
    request.transactionRequest.payment = PaymentType.new
    if tx_params[:account_number].nil?
      tx_params[:account_number] = mock_account_number
    end
    accountNumber = tx_params[:account_number]

    if tx_params[:account_type].nil?
      tx_params[:account_type] = mock_account_type
    end
    accountType = tx_params[:account_type]

    if tx_params[:routing_number].nil?
      tx_params[:routing_number] = mock_routing_number
    end
    routingNumber = tx_params[:routing_number]



    request.transactionRequest.payment.bankAccount = BankAccountType.new(
        "#{accountType}",
        "#{routingNumber}",
        "#{accountNumber}",
        'John Doe',
        'WEB',
        'Wells Fargo Bank NA',
        '101'
    )
    request.transactionRequest.order = OrderType.new("invoiceNumber#{(SecureRandom.random_number*1000000).round(0)}","Order Description")
    response = transaction.create_transaction(request)
    response
  end

  def mock_account_number
    Random.rand(100000000..9999999999).to_s;
  end

  def mock_routing_number
    '122000661'
  end

  def mock_account_type
    'checking'
  end
private
  def tx_params
    params.require(:tx).permit(:amount, :account_type, :routing_number, :account_number, :investor_name)
  end
end
