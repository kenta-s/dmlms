class News < ApplicationRecord
  validates :key, presence: true
  validates :content, presence: true

  enum label: {
    'others': '0',
    'celebrity': '1',
    'sports': '2'
  }

  scope :unlabelled, -> { where(label: nil) }

  class << self
    def generate_filename_as_csv
      Time.current.strftime("%Y%m%d%H%M%S") + '.csv'
    end
  end
end
