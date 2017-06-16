require 'csv'
CSV.generate do |csv|
  csv << ['id', 'content', 'category']
  @news.each do |each_news|
    label = News.labels[each_news.label]
    csv << [each_news.key, each_news.content, label]
  end
end
