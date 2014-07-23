json.array!(@people) do |person|
  json.extract! person, :id, :first_name, :last_name, :bio, :location, :phone_number, :country_code, :languages, :birth_year
  json.url person_url(person, format: :json)
end
