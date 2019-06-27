class User < ApplicationRecord
    validates :user_name, presence: true
    validates :user_name, uniqueness: { case_sensitive: false }
    has_secure_password
    has_many :events
    has_many :rsvps
    has_many :rsvped_events, through: :rsvps, source: :event
end
