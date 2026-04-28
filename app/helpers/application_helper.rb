module ApplicationHelper
  PIO_STAGE_ORDER = %w[cutting seedling growing mature majestic].freeze

  PIO_STAGE_META = {
    "cutting" => { label: "Bouture", color: "var(--pio-leaf)", icon: :sprout },
    "seedling" => { label: "Jeune pousse", color: "var(--pio-mint)", icon: :sprout },
    "growing" => { label: "Plante etablie", color: "var(--pio-sun)", icon: :leaf },
    "mature" => { label: "Plante mature", color: "var(--pio-leaf)", icon: :sparkle },
    "majestic" => { label: "Plante majestueuse", color: "var(--pio-violet)", icon: :sparkle }
  }.freeze

  PIO_EVENT_META = {
    "watering" => { label: "Arrosage", color: "#7CC4FF", icon: :drop },
    "misting" => { label: "Brumisation", color: "var(--pio-leaf)", icon: :mist },
    "repotting" => { label: "Rempotage", color: "var(--pio-soil)", icon: :pot },
    "pruning" => { label: "Taille", color: "var(--pio-cream)", icon: :scissors },
    "new_leaf" => { label: "Nouvelle feuille", color: "var(--pio-mint)", icon: :leaf },
    "flowering" => { label: "Floraison", color: "var(--pio-sun)", icon: :flower },
    "propagation" => { label: "Bouture", color: "var(--pio-leaf)", icon: :sprout },
    "photo_update" => { label: "Photo", color: "var(--pio-cream)", icon: :camera },
    "observation" => { label: "Observation", color: "var(--pio-violet)", icon: :sparkle }
  }.freeze

  def pio_stage_meta(stage)
    PIO_STAGE_META.fetch(stage.to_s, PIO_STAGE_META["seedling"])
  end

  def pio_event_meta(event_type)
    PIO_EVENT_META.fetch(event_type.to_s, PIO_EVENT_META["observation"])
  end

  def pio_stage_tint_class(stage)
    pio_stage_meta(stage)[:color].include?("violet") ? "pio-plant-card-violet" : ""
  end

  def pio_greeting_name(user)
    return "Jardinier" unless user

    user.email_address.to_s.split("@").first.to_s.tr("._-", " ").split.map(&:capitalize).join(" ").presence || "Jardinier"
  end

  def pio_days_since(date)
    return nil unless date

    (Date.current - date).to_i
  end

  def pio_growth_percent(plant)
    return 0 if plant.xp_for_next_level <= 0

    ((plant.xp_progress.to_f / 100) * 100).clamp(0, 100).round
  end

  def pio_level_progress_label(plant)
    "#{plant.xp_progress} / 100 XP sur ce niveau"
  end

  def pio_next_level_label(plant)
    "Niveau #{plant.level + 1}"
  end

  def pio_next_stage_meta(stage)
    current_index = PIO_STAGE_ORDER.index(stage.to_s) || 0
    next_key = PIO_STAGE_ORDER[[current_index + 1, PIO_STAGE_ORDER.size - 1].min]
    return nil if next_key == stage.to_s

    pio_stage_meta(next_key)
  end

  def pio_stage_step_label(stage)
    current_index = PIO_STAGE_ORDER.index(stage.to_s) || 0
    "#{current_index + 1} / #{PIO_STAGE_ORDER.size}"
  end

  def pio_stage_supporting_copy(stage)
    case stage.to_s
    when "cutting"
      "La plante s'installe encore. Chaque observation compte."
    when "seedling"
      "Les premiers signes de croissance vont definir son rythme."
    when "growing"
      "Elle prend sa place. Photos et nouvelles feuilles donnent le ton."
    when "mature"
      "Sa silhouette est bien installee. Les updates deviennent de vrais souvenirs."
    when "majestic"
      "C'est une plante phare de la collection. Chaque evenement est un milestone."
    else
      "Chaque mise a jour aide a raconter sa progression."
    end
  end

  def pio_icon(name, size: 20, classes: nil, stroke_width: 1.9)
    body =
      case name.to_sym
      when :leaf
        '<path d="M4 20c12 0 16-8 16-16-8 0-16 4-16 16Z"/><path d="M4 20c4-4 8-6 12-8"/>'
      when :drop
        '<path d="M12 3s7 7.5 7 12a7 7 0 0 1-14 0c0-4.5 7-12 7-12Z"/>'
      when :pot
        '<path d="M5 11h14l-2 9H7l-2-9Z"/><path d="M4 11h16"/><path d="M9 11c0-3 1-5 3-5s3 2 3 5"/>'
      when :camera
        '<rect x="3" y="7" width="18" height="13" rx="2"/><circle cx="12" cy="13" r="3.5"/><path d="M9 7l1.5-2h3L15 7"/>'
      when :sprout
        '<path d="M12 20v-6"/><path d="M12 14c0-3 2-6 6-6 0 4-2 6-6 6Z"/><path d="M12 14c0-3-2-6-6-6 0 4 2 6 6 6Z"/>'
      when :flower
        '<circle cx="12" cy="12" r="2"/><path d="M12 4a3 3 0 0 0 0 6 3 3 0 0 0 0-6Z"/><path d="M12 14a3 3 0 0 1 0 6 3 3 0 0 1 0-6Z"/><path d="M4 12a3 3 0 0 1 6 0 3 3 0 0 1-6 0Z"/><path d="M14 12a3 3 0 0 1 6 0 3 3 0 0 1-6 0Z"/>'
      when :scissors
        '<circle cx="6" cy="6" r="3"/><circle cx="6" cy="18" r="3"/><path d="M20 4 8.5 15.5"/><path d="M14 14l6 6"/>'
      when :sparkle
        '<path d="M12 3v6M12 15v6M3 12h6M15 12h6"/><path d="M5 5l3 3M16 16l3 3M19 5l-3 3M5 19l3-3"/>'
      when :mist
        '<path d="M5 9h14M3 13h12M7 17h14M5 21h10"/>'
      when :home
        '<path d="M3 11 12 4l9 7"/><path d="M5 10v10h14V10"/>'
      when :book
        '<path d="M5 4h11a3 3 0 0 1 3 3v13H8a3 3 0 0 1-3-3V4Z"/><path d="M5 17a3 3 0 0 1 3-3h11"/>'
      when :plus
        '<path d="M12 5v14M5 12h14"/>'
      when :medal
        '<circle cx="12" cy="14" r="6"/><path d="M9 8 7 3h10l-2 5"/>'
      when :user
        '<circle cx="12" cy="8" r="4"/><path d="M4 21c0-4 4-7 8-7s8 3 8 7"/>'
      when :bell
        '<path d="M6 16V11a6 6 0 1 1 12 0v5l1.5 2H4.5L6 16Z"/><path d="M10 20a2 2 0 0 0 4 0"/>'
      when :chevron_left
        '<path d="m15 6-6 6 6 6"/>'
      when :dots
        '<circle cx="5" cy="12" r="1.4" fill="currentColor" stroke="none"/><circle cx="12" cy="12" r="1.4" fill="currentColor" stroke="none"/><circle cx="19" cy="12" r="1.4" fill="currentColor" stroke="none"/>'
      else
        ""
      end

    content_tag(
      :svg,
      body.html_safe,
      xmlns: "http://www.w3.org/2000/svg",
      width: size,
      height: size,
      viewBox: "0 0 24 24",
      fill: "none",
      stroke: "currentColor",
      "stroke-width": stroke_width,
      "stroke-linecap": "round",
      "stroke-linejoin": "round",
      class: classes
    )
  end
end
