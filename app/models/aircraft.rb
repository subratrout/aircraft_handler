class Aircraft < ActiveRecord::Base
  # que_name is added before entering data into table
  before_create :add_queue_name

  #validation for aircraft type and size presence
  validates :aircraft_type, :aircraft_size, presence: true

  # List type of aircrafts
  AIRCRAFT_TYPES = ["cargo", "passenger"]

  # List size of aircrafts
  AIRCRAFT_SIZES = ["small", "large"]

  #scope for finding aircrafts
  scope 'large_passenger', -> {where(que_name: 'large_passenger')}
  scope 'small_passenger', -> {where(que_name: 'small_passenger')}
  scope 'large_cargo', -> {where(que_name: 'large_cargo')}
  scope 'small_cargo', -> {where(que_name: 'small_cargo')}

  def self.dequeue
    case
    when Aircraft.large_passenger.first.present?
      Aircraft.large_passenger.first.destroy
    when Aircraft.small_passenger.first.present?
      Aircraft.small_passenger.first.destroy
    when Aircraft.large_cargo.first.present?
      Aircraft.large_cargo.first.destroy
    when Aircraft.small_cargo.first.present?
      Aircraft.small_cargo.first.destroy
    else
      return 'There is no aircraft to Dequeue'
    end
  end

  private

  def add_queue_name
    self.que_name = "#{self.aircraft_size}_#{self.aircraft_type}"
  end
end
