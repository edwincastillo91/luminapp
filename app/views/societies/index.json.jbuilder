json.array!(@societies) do |society|
  json.extract! society, :id, :name
  json.url society_url(society, format: :json)
end
