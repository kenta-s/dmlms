@news.pluck(:source).uniq.each do |source|
  json.set! source do
    @news.where(source: source).each do |news|
      json.set! news.key, {content: news.content, label: news.label_for_export }
    end
  end
end
