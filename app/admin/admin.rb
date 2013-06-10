ActiveAdmin.register AdminUser do
	menu :priority => 5
	
	filter :email
	filter :password
	
	index do
		column :email
		column :password
		default_actions
	end
	
	
	form do |f|
		f.inputs do
			f.input :email
			f.input :password, :as => :password
		end
	  f.buttons
	end  
	
	
	
	
	sidebar :need_help? do
    "Need help? Email us at hello@pignite.com"
  end 
	  
end
