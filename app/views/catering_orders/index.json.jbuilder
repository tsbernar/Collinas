json.array!(@catering_orders) do |catering_order|
  json.extract! catering_order, :id
  json.url catering_order_url(catering_order, format: :json)
end
