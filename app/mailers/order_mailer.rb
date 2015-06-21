class OrderMailer < ApplicationMailer
	default from: "order@bulletordering.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.order_receipt.subject
  #
  def order_receipt(order)
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
