Category.destroy_all

# categories = ["Audio", "Computacion", "Gatgets"]

# # 3.times do
# #     model = Faker::Vehicle.make_and_model
# # end

# categories.each do |category|
#     Category.create(name: category)
# end

Category.create(name: "Componentes")
Category.create(name: "Computacion")
Category.create(name: "Accesorios")