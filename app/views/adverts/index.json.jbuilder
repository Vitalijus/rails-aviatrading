json.array!(@adverts) do |advert|
  json.extract! advert, :id, :title, :name, :surname, :email
  json.url advert_url(advert, format: :json)
end
