class DashboardController < ApplicationController
  def index
    @plants = current_user.plants.includes(:plant_events, plant_photos: [ image_attachment: :blob ]).order(created_at: :desc)
    @featured_plant = @plants.first
    @today_xp = current_user.plants.joins(:plant_events).where(plant_events: { occurred_at: Time.zone.today.all_day }).sum(:xp_delta)
    @latest_observation = @featured_plant&.plant_events&.where(event_type: %w[observation new_leaf flowering])&.order(occurred_at: :desc)&.first
  end
end
