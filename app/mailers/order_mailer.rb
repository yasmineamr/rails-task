class OrderMailer < ApplicationMailer
  default from: 'Test Admin <a@gmail.com>'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.received.subject
  #
  def received(cart, user)
    @order = cart
    @name = user.name
    mail to: user.email, subject: 'Order Confirmation'
  end
end
