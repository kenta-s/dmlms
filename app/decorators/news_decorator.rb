module NewsDecorator
  def label_for_csv
    News.labels[label]
  end
end
