require 'rails_helper'

RSpec.describe 'User Serializer' do
  it "returns the JSON User object within the serializer's format" do
    user = User.new(name: 'Dylan', email: 'dt@example.com', password: 'password', password_confirmation: 'password')
    user.save

    serialized_user = UserSerializer.new(user).serializable_hash

    expected_format = {
      data: {
        type: "user",
        id: "#{user.id}",
        attributes: {
          name: 'Dylan',
          email: 'dt@exaple.com',
          api_key: "#{user.api_key}"
        }
      }
    }
  end
end