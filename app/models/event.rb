class Event < ApplicationRecord
  has_many :user_events
  has_many :users, through: :user_events

  belongs_to :user

  enum event_type: { workshop: 'Work Shop', seminar: 'Seminar', conference: 'Conference', reunions: 'Reunions', party: 'Party' }
end
