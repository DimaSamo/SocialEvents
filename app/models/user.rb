class User < ApplicationRecord
    #Validations
    validates :user_name, presence: true
    validates :user_name, uniqueness: { case_sensitive: false }
    has_secure_password
    #Associations
    has_many :events
    has_many :rsvps
    has_many :rsvped_events, through: :rsvps, source: :event

    def full_name
        "#{self.first_name} #{self.last_name}"
    end
end
