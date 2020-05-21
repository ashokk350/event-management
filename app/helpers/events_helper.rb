module EventsHelper
  def already_registered?(event)
    'disabled' if current_user.user_events.find_by(event_id: event.id).present?
  end

  def allow_leave(user_id)
    'disabled' unless current_user.id == user_id
  end

  def show_cost(cost)
    (cost - ((cost * 5) / 100))
  end

  def get_benefit(cost)
    ((cost * 5) / 100)
  end

  def is_event_closed?(event)
    Time.parse(event.end_time.strftime("%Y-%m-%d %H:%M")) > Time.now
  end
end
