json.array!(@universes) do |univers|
  json.extract! univers, :id
  json.url univers_url(univers, format: :json)
end
