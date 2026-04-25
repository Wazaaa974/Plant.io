class PlantEvent < ApplicationRecord
  EVENT_TYPES = {
    watering: "watering",
    misting: "misting",
    repotting: "repotting",
    pruning: "pruning",
    new_leaf: "new_leaf",
    flowering: "flowering",
    propagation: "propagation",
    photo_update: "photo_update",
    observation: "observation"
  }.freeze

  belongs_to :plant

  enum :event_type, EVENT_TYPES, validate: true

  validates :title, :occurred_at, presence: true
  validates :xp_delta, numericality: true

  before_validation :set_defaults, on: :create

  private
    def set_defaults
      self.occurred_at ||= Time.current
      self.xp_delta ||= 0
    end
end
