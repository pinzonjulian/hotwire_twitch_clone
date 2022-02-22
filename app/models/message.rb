class Message < ApplicationRecord
  belongs_to :live_stream
  broadcasts_to :live_stream
end
