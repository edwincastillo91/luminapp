json.array!(@characters) do |character|
  json.extract! character, :id, :first_name, :last_name, :drive, :wound, :eyes_color, :hair_color, :height, :weight, :race, :sex, :genetic_modification, :social_class, :sexual_orientation, :genre
  json.url character_url(character, format: :json)
end
