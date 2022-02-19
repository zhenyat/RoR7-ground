json.extract! person, :id, :name, :role, :content, :created_at, :updated_at
json.url person_url(person, format: :json)
json.content person.content.to_s
