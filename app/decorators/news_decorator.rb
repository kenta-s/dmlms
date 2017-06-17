module NewsDecorator
  def label_for_export
    News.labels[label]
  end
end
