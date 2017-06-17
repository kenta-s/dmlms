@news.each do |news|
  json.set! news.key, { content: news.content, label: news.label_for_export }
end
