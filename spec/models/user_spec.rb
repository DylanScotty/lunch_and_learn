require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_confirmation_of(:password) }
  end

  describe "relationships" do
    it { should have_many(:favorites) }
  end

  describe "methods" do
    it "generates an API key before create" do
      user = User.new(name: 'Dylan', email: 'dylan@example.com', password: 'password', password_confirmation: 'password')
      user.save

      expect(user.api_key).not_to be_nil
    end
  end
end