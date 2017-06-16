require 'csv'
CSV.generate do |csv|
  csv << ['id', 'content', 'category']
  @news.each do |each_news|
    csv << [each_news.key, each_news.content, each_news.label_for_csv]
  end
end
