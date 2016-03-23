json.array!(@artefacts) do |artefact|
  json.extract! artefact, :id, :name
  json.url artefact_url(artefact, format: :json)
end
