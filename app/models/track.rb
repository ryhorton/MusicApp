class Track < ActiveRecord::Base

  belongs_to :album

  validates :album_id, :track_type, :lyrics, presence: true

  TRACK_TYPES = %w(Bonus Regular)
end
