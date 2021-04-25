ActiveAdmin.register Category do
        permit_params :name
         actions :all, :except => [:show]
         config.remove_action_item(:destroy)
    
        filter :name
      
        index do
          selectable_column
          id_column
          column :name
          column :user
          actions
        end
      
        show do
          attributes_table do
            row :name
        end
      
        form do |f|
          f.semantic_errors
      
          f.inputs do
            f.input :name
          end
      
          f.actions
          
        end
        
        # menu false
    end
    
end