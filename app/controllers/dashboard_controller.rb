class DashboardController < ApplicationController
  def index
    @plants = current_user.plants.includes(:plant_events, plant_photos: [ image_attachment: :blob ]).order(created_at: :desc)
  end
end
