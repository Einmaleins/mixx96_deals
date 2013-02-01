ActiveAdmin.register Order do
  scope :completed, :default => true
  scope :incomplete
  scope :all

  filter :number
  filter :merchants
  filter :deal


  index do
    column :number
    column :last_name
    column :first_name
    column :deal
    column :merchant
    column :price do |order|
      number_to_currency(order.transactions.last.amount/100)
    end
    default_actions
  end

  form do |f|
    f.inputs do 
      f.input :deal, :as => :select, :required => true
      #f.input :merchant
      f.input :first_name, :required => true
      f.input :last_name, :required => true
      f.input :address, :required => true 
      f.input :address2
      f.input :city
      f.input :state, :as => :select, :collection => us_states, :selected => "WA"
      f.input :zip
      f.input :card_type, :as => :select, :collection => [["Visa", "visa"], ["MasterCard", "master"], ["Discover", "discover"], ["American Express", "american_express"]], :required => :true     
      f.input :card_expires_on, :as => :date, :discard_day => true, :start_year => Date.today.year, :end_year => (Date.today.year+10), :add_month_numbers => true
      f.input :card_verification, :label => 'Card Verification Value (CVV)'
      f.input :completed
      f.input :card_number
    end
    f.buttons
  end  
end
