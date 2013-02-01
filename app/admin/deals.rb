ActiveAdmin.register Deal do
	menu :priority => 1
	
	filter :name
	filter :merchant
	filter :categories
	
	index do
		column :merchant
		column :name do |deal|
			div do 
				image_tag(deal.image.url(:thumb))
				
			end
			h5 do deal.name end
		end
		
		column :price do |deal|
			number_to_currency(deal.price)
		end
		column :quantity
		column :end_date
		default_actions
	end
	
	
	form do |f|
		f.inputs do
			f.input :merchant
			f.input :image, :as => :file, :hint => (f.template.image_tag(f.object.image.url) if !f.object.image.url.blank?), :hint => "Must be 360 pixels wide x 270 pixels high or 4 x 3"
  			f.input :image_cache, :as => :hidden 
			f.input :featured
			f.input :priority, :as => :string
			f.input :name
			f.input :tagline
			f.input :description
			f.input :normal_price, :as => :string
			f.input :price, :as => :string
			f.input :quantity, :as => :string
			f.input :start_date, :as => :date
			f.input :end_date, :as => :date
			f.input :expiration_date, :as => :date
			f.input :categories, :as => :check_boxes
		end
	  f.buttons
	end  
	
	
	
	
	sidebar :need_help? do
    "Need help? Email us at hello@pignite.com"
  end 
	  
end
