class Product < ApplicationRecord
  belongs_to :live_stream
  enum :category, cooking: 0, climate: 1, gaming: 2
end
