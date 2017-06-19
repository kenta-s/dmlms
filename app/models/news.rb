class News < ApplicationRecord
  validates :key, presence: true
  validates :content, presence: true
  validates :source, presence: true

  enum label: {
    'celebrity': '1',
    'sports': '2',
    'others': '0'
  }

  scope :unlabelled, -> { where(label: nil) }

  class << self
    def generate_filename_as_csv
      Time.current.strftime("%Y%m%d%H%M%S") + '.csv'
    end
  end
end
