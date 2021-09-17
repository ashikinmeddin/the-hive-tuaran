class Orders < ApplicationMailer
  default from: 'no-reply@example.com'

  def new_order_notification(order)
    @order = order
    @user = order.user
    @host = order.host

    mail(to: [@user.email, @host.email],
      subject: "New order notification")
  end
end
