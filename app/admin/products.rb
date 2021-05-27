ActiveAdmin.register Product do
    permit_params :name, :stock, :description, :price, :sku, :image, :category_ids
     actions :all


    filter :name
  
    index do
      selectable_column
      id_column
      column :name
      actions
    end
  
    show do
      attributes_table do
        row :name
        row :stock
        row :description
        row :price
        row :sku
        row :image
      end
    end
  
    form do |f|
      f.semantic_errors
  
      f.inputs do
        f.input :name
        f.input :stock
        f.input :description
        f.input :price
        f.input :sku
        f.input :image
        # f.input :user_id
      end
  
      f.actions
      
    end

    
    # menu false
end
    # t.string "name"
    # t.integer "stock"
    # t.text "description"
    # t.integer "price"
    # t.string "sku"