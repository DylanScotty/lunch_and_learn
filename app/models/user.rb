class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, confirmation: true

    has_many :favorites
  
    has_secure_password
  
    before_create :generate_api_key
  
    private
  
    def generate_api_key
      self.api_key = SecureRandom.hex
    end
  end