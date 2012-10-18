ActiveAdmin.register Ad do
  
  index do
    column :merchant
    column :name
    column :end_date 
    default_actions 
  end  

  form do |f|
    f.inputs do
      f.input :merchant
      f.input :image, :as => :file, :hint => (f.template.image_tag(f.object.image.url) if !f.object.image.url.blank?)
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