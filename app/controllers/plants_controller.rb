class PlantsController < ApplicationController
  before_action :set_plant, only: :show

  def index
    @plants = current_user.plants.includes(:plant_events, plant_photos: [ image_attachment: :blob ]).order(created_at: :desc)
  end

  def show
    @plant_photos = @plant.plant_photos.with_attached_image.recent_first
    @plant_events = @plant.plant_events.order(occurred_at: :desc, created_at: :desc)
    @latest_observation = @plant.plant_events.where(event_type: %w[observation new_leaf flowering]).order(occurred_at: :desc).first
    @days_together = @plant.acquired_at.present? ? (Date.current - @plant.acquired_at).to_i : nil
    @remaining_xp = [@plant.xp_for_next_level - @plant.xp, 0].max
  end

  def new
    @plant = current_user.plants.new(acquired_at: Date.current)
    @plant.plant_photos.build(taken_at: Time.current)
  end

  def create
    @plant = current_user.plants.new(plant_params.except(:plant_photo))

    ActiveRecord::Base.transaction do
      @plant.save!
      create_initial_photo! if plant_photo_params[:image].present?
      create_initial_event!
    end

    redirect_to @plant, notice: "#{@plant.display_name} joined your collection."
  rescue ActiveRecord::RecordInvalid
    flash.now[:alert] = @plant.errors.full_messages.to_sentence.presence || "Please review the form."
    @plant.plant_photos.build(taken_at: Time.current) if @plant.plant_photos.empty?
    render :new, status: :unprocessable_entity
  end

  private
    def set_plant
      @plant = current_user.plants.includes(:plant_events, plant_photos: [ image_attachment: :blob ]).find(params[:id])
    end

    def plant_params
      params.require(:plant).permit(
        :nickname,
        :species_name,
        :common_name,
        :description,
        :growth_stage,
        :acquired_at,
        :location_name,
        plant_photo: %i[image taken_at notes]
      )
    end

    def plant_photo_params
      plant_params.fetch(:plant_photo, {})
    end

    def create_initial_photo!
      @plant.plant_photos.create!(
        taken_at: plant_photo_params[:taken_at].presence || Time.current,
        notes: plant_photo_params[:notes],
        ai_analysis_status: "pending"
      ).tap do |photo|
        photo.image.attach(plant_photo_params[:image])
      end
    end

    def create_initial_event!
      @plant.plant_events.create!(
        event_type: "observation",
        title: "Plant added to collection",
        notes: "First record created for #{@plant.display_name}.",
        xp_delta: 10
      )
      @plant.update!(xp: 10)
    end
end
