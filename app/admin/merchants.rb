ActiveAdmin.register Merchant do
	menu :priority => 3
	
	filter :name

  index do
    column :name
    column :address do |merchant|
      "#{merchant.address} \n #{merchant.city}, #{merchant.state} #{merchant.zip}"
    end
    column :phone_number
    column :email
    column :homepage
    column :map_link
    default_actions
  end  
  
	show :title => :name do
		render "merchant_show", :merchant => merchant
	end
  

	form do |f|
		f.inputs "Details" do
			f.input :name
			f.input :homepage
			f.input :logo, :as => :file, :hint => "Must be 360 pixels wide x 268 pixels high or 4 x 3"
			#f.input :logo_cache, :as => :hidden
			f.input :categories, :as => :check_boxes
		end

	  f.inputs "Address" do
	    f.input :address
	    f.input :address2
	    f.input :city
	    f.input :state, :as => :select, :collection => us_states, :selected => "WA"
			f.input :zip
			f.input :map_link, :as => :url
	  end
	  f.inputs "Contact Information" do
	    f.input :phone_number
	    f.input :email
	  end
	  f.buttons
	end  
	
	sidebar :need_help? do
    "Need help? Email us at hello@pignite.com"
  end 
end
