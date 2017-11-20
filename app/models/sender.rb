class Sender < ApplicationRecord
  has_many :cards
  accepts_nested_attributes_for :cards, allow_destroy: true
end
