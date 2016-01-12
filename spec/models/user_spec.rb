require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    user = build(:user)
    expect(user).to be_valid
  end

  it "has a valid super_admin factory" do
    super_admin = build(:super_admin)
    expect(super_admin).to be_valid
  end

  it { is_expected.to validate_presence_of(:email) }

end