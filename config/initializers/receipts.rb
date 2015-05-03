Receipts::Receipt.class_eval do
  def default_message
    "We've received your payment for #{attributes.fetch(:product)}. You can keep this receipt for your records."
  end
end