# class Product < ApplicationRecord
#     # has_and_belongs_to_many :categories

#     has_many :product_categories
#     has_many :categories, through: :product_categories , dependent: :destroy

#     has_many :product_categories
#     has_many :categories, through: :product_categories
# end


# viws index

# <p id="notice"><%= notice %></p>

# <h1>Products</h1>

# <table>
#   <thead>
#     <tr>
#       <th>Name</th>
#       <th>Stock</th>
#       <th>Description</th>
#       <th>price</th>
#       <th>Sku</th>
#       <th colspan="3"></th>
#     </tr>
#   </thead>

#   <tbody>
#     <% @products.each do |product| %>
#       <tr>
#         <td><%= product.name %></td>
#         <td><%= product.stock %></td>
#         <td><%= product.description %></td>
#         <td><%= product.price %></td>
#         <td><%= product.sku %></td>
#         <td><%= link_to 'Show', product %></td>
#         <td><%= link_to 'Edit', edit_product_path(product) %></td>
#         <td><%= link_to 'Destroy', product, method: :delete, data: { confirm: 'Are you sure?' } %></td>
#       </tr>
#     <% end %>
#   </tbody>
# </table>

# <br>

# <%= link_to 'New Product', new_product_path %>



#formulario 


# <%= form_with(model: product, local: true) do |form| %>
#     <% if product.errors.any? %>
#       <div id="error_explanation">
#         <h2><%= pluralize(product.errors.count, "error") %> prohibited this product from being saved:</h2>
  
#         <ul>
#         <% product.errors.full_messages.each do |message| %>
#           <li><%= message %></li>
#         <% end %>
#         </ul>
#       </div>
#     <% end %>
  
#     <div class="field">
#       <%= form.label :name %>
#       <%= form.text_field :name %>
#     </div>
  
#     <div class="field">
#       <%= form.label :stock %>
#       <%= form.number_field :stock %>
#     </div>
  
#     <div class="field">
#       <%= form.label :description %>
#       <%= form.text_area :description %>
#     </div>
  
#     <div class="field">
#       <%= form.label :price %>
#       <%= form.number_field :price %>
#     </div>
  
#     <div class="field">
#       <%= form.label :sku %>
#       <%= form.text_field :sku %>
#     </div>
  
#     <div class="field">
#       <%= form.label :category, class:"1" %>
#       <ul class= "field-space">
#       <%= form.collection_check_boxes :category_ids, Category.all, :id, :name %>
#       </ul>
#     </div>
  
#     <div class="actions">
#       <%= form.submit %>
#     </div>
#   <% end %>
  