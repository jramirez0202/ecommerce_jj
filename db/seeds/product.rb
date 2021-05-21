Product.destroy_all

# Category.all.each do |category|
#     4.times do |i|
#         product_attributes = {
#             name:"Producto_#{i}",
#             stock: rand(1..100),
#             price: rand(10..20)*990,
#             sku:('A'..'Z').to_a.shuffle.first(10).join
#         }
#         Product.create(product_attributes).categories << category 
#     end
# end

category_1 = Category.find_by(name: "Smartphones")

p_01 = Product.create(name: "iPhone XS", description: "Super retina screen", stock: 10, price: 900, sku: "AIX0120")
p_01.categories << category_1

p_02 = Product.create(name: "Xiaomi Mi Mix 3", description: "Borderless, powerful, super camera", stock: 12, price: 400, sku: "XMM0312")
p_02.categories << category_1

category_2 = Category.find_by(name: "Computacion")

p_05 = Product.create(name: "Notebook", description: "The best notebook ever", stock: 50, price: 5, sku: "ZSD009")
p_05.categories << category_2

p_06 = Product.create(name: "Disco duro", description: "2000 gigas", stock: 13, price: 60, sku: "ASS090")
p_06.categories << category_2

category_3 = Category.find_by(name: "Accesories")

p_08 = Product.create(name: "Pendrive", description: "Waterproof", stock: 50, price: 20, sku: "MW2323")
p_08.categories << category_3

p_09 = Product.create(name: "Case metalico", description: "Para todos", stock: 60, price: 2, sku: "KC3245")
p_09.categories << category_3