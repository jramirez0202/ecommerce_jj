json.extract! product, :id, :name, :stock, :description, :ṕrice, :sku, :created_at, :updated_at
json.url product_url(product, format: :json)
