class PlantPhoto < ApplicationRecord
  belongs_to :plant
  has_one_attached :image

  validates :taken_at, presence: true

  before_validation :set_taken_at, on: :create

  scope :recent_first, -> { order(taken_at: :desc, created_at: :desc) }

  private
    def set_taken_at
      self.taken_at ||= Time.current
    end
end
