class News < ApplicationRecord
  validates :key, presence: true
  validates :content, presence: true
end
