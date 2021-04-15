Product.destroy_all

Category.all.each do |category|
    4.times do |i|
        product_attributes = {
            name:"Producto_#{i}",
            stock: rand(1..100),
            price: rand(10..20)*990,
            sku:('A'..'Z').to_a.shuffle.first(10).join
        }
        Product.create(product_attributes).categories << category 
    end
end

