class Api::V1::InvoicesTransactionsController < Api::BaseController
  def index
    respond_with Invoice.find(params[:id]).transactions
    # ActiveModel::ArraySerializer.new(transactions, each_serializer: InvoiceTransactionSerializer)
    #, serializer: InvoiceTransactionSerializer
  end
end
