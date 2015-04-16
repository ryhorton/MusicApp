class Album < ActiveRecord::Base

  belongs_to :band
  has_many :tracks, dependent: :destroy

  validates :band_id, presence: true
  # validates :recording_type, inclusion: RECORDING_TYPES

  RECORDING_TYPES = %w(Live Studio)

end
