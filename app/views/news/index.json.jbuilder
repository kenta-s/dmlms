@news.each do |news|
  json.set! news.key, { source: news.source, content: news.content, label: news.label_for_export }
end
