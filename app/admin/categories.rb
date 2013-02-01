ActiveAdmin.register Category do
	menu :priority => 4
 config.sort_order = "sort_asc"
  form do |f|
    f.inputs do
      f.input :name
      f.input :sort
    end
    f.buttons
  end


	sidebar :help do
    "Need help? Email us at hello@pignite.com"
  end  
end
