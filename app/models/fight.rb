class Fight < ApplicationRecord
  validates :loser, presence: true
  validates :winner, presence: true

  belongs_to :loser, class_name: "Fighter"
  belongs_to :winner, class_name: "Fighter"
end
