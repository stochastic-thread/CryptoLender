class PaymentGatewayController < ApplicationController
  include AuthorizeNet::API
  def create_transaction
    transaction = Transaction.new(ENV['AA'], ENV['AB'], :gateway => :sandbox)
    request_test = CreateTransactionRequest.new
    request_test.transactionRequest = TransactionRequestType.new()
    request_test.transactionRequest.amount = tx_params[:amount].to_f.round(2)
    ap request_test.transactionRequest.amount.class
    request_test.transactionRequest.payment = PaymentType.new
    txparams = tx_params
    if txparams[:account_number].nil? || txparams[:account_number].size == 0
      txparams[:account_number] = mock_account_number
    end
    accountNumber = txparams[:account_number]

    if txparams[:account_type].nil? || txparams[:account_type].size == 0
      txparams[:account_type] = mock_account_type
    end
    accountType = txparams[:account_type]

    if txparams[:routing_number].nil? || txparams[:routing_number].size == 0
      txparams[:routing_number] = mock_routing_number
    end
    routingNumber = txparams[:routing_number]

    ap "Account number (test): #{accountNumber}"
    ap "Account type (test): #{accountType}"
    ap "Routing number (test): #{routingNumber}"


    # request = CreateTransactionRequest.new
    # request.transactionRequest = TransactionRequestType.new()
    # request.transactionRequest.amount = ((SecureRandom.random_number + 1 ) * 15 ).round(2)
    # request.transactionRequest.payment = PaymentType.new
    #Generate random bank account number
    randomAccountNumber= Random.rand(100000000..9999999999).to_s
    request_test.transactionRequest.payment.bankAccount = BankAccountType.new('checking',"#{routingNumber}","#{accountNumber}", 'John Doe','WEB','Wells Fargo Bank NA','101')
    request_test.transactionRequest.transactionType = TransactionTypeEnum::AuthCaptureTransaction
    request_test.transactionRequest.order = OrderType.new("invoiceNumber#{(SecureRandom.random_number*1000000).round(0)}","Order Description")

    @response = transaction.create_transaction(request_test)




    # request.transactionRequest.payment.bankAccount = BankAccountType.new(
    #     "#{accountType}",
    #     "#{routingNumber}",
    #     "#{accountNumber}",
    #     'John Doe',
    #     'WEB',
    #     'Wells Fargo Bank NA',
    #     '101'
    # )
    #
    # ap request.transactionRequest.payment.bankAccount
    #
    # request.transactionRequest.order = OrderType.new("invoiceNumber#{(SecureRandom.random_number*1000000).round(0)}","Order Description")
    # response = transaction.create_transaction(request)
    if @response != nil
      if @response.messages.resultCode == MessageTypeEnum::Ok
        if @response.transactionResponse != nil && (@response.transactionResponse.messages != nil)
          puts "Successfully debited bank account."
          puts "  Transaction ID: #{@response.transactionResponse.transId}"
          puts "  Transaction response code: #{@response.transactionResponse.responseCode}"
          puts "  Code: #{@response.transactionResponse.messages.messages[0].code}"
          puts "  Description: #{@response.transactionResponse.messages.messages[0].description}"
        else
          puts "Transaction Failed"
          puts "Transaction response code: #{@response.transactionResponse.responseCode}"
          if @response.transactionResponse.errors != nil
            puts "  Error Code: #{@response.transactionResponse.errors.errors[0].errorCode}"
            puts "  Error Message: #{@response.transactionResponse.errors.errors[0].errorText}"
          end
          puts "Failed to debit bank account."
        end
      else
        puts "Transaction Failed"
        if @response.transactionResponse != nil && @response.transactionResponse.errors != nil
          puts "  Error Code: #{@response.transactionResponse.errors.errors[0].errorCode}"
          puts "  Error Message: #{@response.transactionResponse.errors.errors[0].errorText}"
        else
          puts "  Error Code: #{@response.messages.messages[0].code}"
          puts "  Error Message: #{@response.messages.messages[0].text}"
        end
        puts "Failed to debit bank account."
      end
    else
      puts "Response is null"
      raise "Failed to debit bank account."
    end
    @response
  end

  def mock_account_number
    Random.rand(100000000..9999999999).to_s
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
