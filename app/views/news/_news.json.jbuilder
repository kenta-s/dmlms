json.extract! news, :id, :key, :content, :label, :created_at, :updated_at
json.url news_url(news, format: :json)
