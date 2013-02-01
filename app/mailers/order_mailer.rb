class OrderMailer < ActionMailer::Base
  default from: "mixxmall@mixx96.com"

  def order_confirmation(user, order)
    @user = user
    @order = order
    mail(:to => user.email, :bcc => 'mixxmall@mixx96.com', :subject => "MixxMall Order Confirmation")
  end

  def deal_feedback(feedback)
    @feedback = feedback
    mail(:to => "mixxmall@mixx96.com", :subject => "MixxMall Deal Feeback")
  end
end
