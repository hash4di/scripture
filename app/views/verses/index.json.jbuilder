json.array!(@verses) do |verse|
  json.extract! verse, :id, :title, :description, :label, :color
  json.url verse_url(verse, format: :json)
end
