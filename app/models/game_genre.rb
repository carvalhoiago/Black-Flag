class GameGenre < ApplicationRecord
  belongs_to :game
  has_one :genre
end
