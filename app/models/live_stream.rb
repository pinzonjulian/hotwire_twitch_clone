class LiveStream < ApplicationRecord
  has_many :products
  has_many :messages
end
