class User < ApplicationRecord
    #Validations
    validates :user_name, presence: true
    validates :user_name, uniqueness: { case_sensitive: false }
    has_secure_password
    #Associations
    has_many :events
    has_many :rsvps
    has_many :rsvped_events, through: :rsvps, source: :event
    
    def self.from_omniauth(auth)
        
        where(email: auth.info.email).first_or_initialize do |user|
          binding.pry
          user.user_name = auth.info.name
          user.first_name = auth.first_name
          user.last_name = auth.last_name
          user.email = auth.info.email
          user.password = SecureRandom.hex
        end
     end

    def full_name
        "#{self.first_name} #{self.last_name}"
    end

    
end
