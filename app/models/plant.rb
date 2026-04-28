class Plant < ApplicationRecord
  STAGES = {
    cutting: "cutting",
    seedling: "seedling",
    growing: "growing",
    mature: "mature",
    majestic: "majestic"
  }.freeze

  belongs_to :user
  has_many :plant_photos, dependent: :destroy
  has_many :plant_events, dependent: :destroy

  enum :growth_stage, STAGES, validate: true

  validates :nickname, presence: true
  validates :xp, numericality: { greater_than_or_equal_to: 0 }
  validates :level, numericality: { greater_than: 0 }

  before_validation :sync_level

  def display_name
    nickname.presence || species_name
  end

  def species_label
    species_name.presence || common_name.presence || "Espece a confirmer"
  end

  def hero_photo
    plant_photos.with_attached_image.order(taken_at: :desc, created_at: :desc).find { |photo| photo.image.attached? }
  end

  def xp_for_next_level
    level * 100
  end

  def xp_progress
    current_level_base = (level - 1) * 100
    [xp - current_level_base, 0].max
  end

  private
    def sync_level
      self.level = (xp / 100) + 1
    end
end
