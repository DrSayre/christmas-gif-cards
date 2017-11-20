class Card < ApplicationRecord
  belongs_to :sender
  mount_uploaders :gif, GifUploader
  serialize :gif, JSON
end
