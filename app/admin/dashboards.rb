ActiveAdmin::Dashboards.build do

  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.
  
  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  #
    section "Recent Deals", :priority => 10 do
      ul do
        Deal.recent.collect do |deal|
          li link_to(deal.name, admin_deal_path(deal))
        end
      end
    end

    section "Recent Orders", :priority => 1 do  
    table_for Order.recent.collect do |order| 
      column("Order") {|order|link_to(order.number, admin_order_path(order)) } 
      column("Customer") {|order|"#{order.first_name} #{order.last_name}"}
      column ("Deal") {|order| "#{order.deal.name}"}
      #column ("Amount") {|order| order.transactions.amount}
    end 
  end  
  
  # section "Recent Customers" do
  #     table_for User.order('id desc').limit(10).each do |customer|
  #       column(:email) {|customer| link_to(customer.email, admin_customer_path(customer)) }
  #     end
  # end
  
  # == Render Partial Section
  # The block is rendered within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end
  
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.
  
  # == Conditionally Display
  # Provide a method name or Proc object to conditionally render a section at run time.
  #
  # section "Membership Summary", :if => :memberships_enabled?
  # section "Membership Summary", :if => Proc.new { current_admin_user.account.memberships.any? }

end
