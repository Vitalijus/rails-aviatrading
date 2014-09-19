json.array!(@orders) do |order|
  json.extract! order, :id, :name_on_card, :stripe_customer_token, :course_id
  json.url order_url(order, format: :json)
end
