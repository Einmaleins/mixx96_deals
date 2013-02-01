ActiveAdmin.register Event do
  
  index do
    column :merchant
    column :name
    column :start_date
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
      f.input :start_date    
      f.input :end_date
    end
    f.buttons
  end  
end
