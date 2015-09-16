class Aircraft < ActiveRecord::Base

  validates :aircraft_type, :aircraft_size, presence: true

  # List type of aircrafts
  AIRCRAFT_TYPES = ["cargo", "passenger"]

  # List size of aircrafts
  AIRCRAFT_SIZES = ["small", "large"]


end
