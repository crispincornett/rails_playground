require 'rails_helper'

RSpec.describe Client, type: :model do
  it "has a valid factory" do
    client = build(:client)
    expect(client).to be_valid
  end

  it { is_expected.to validate_presence_of(:short_name) }
  it { is_expected.to validate_presence_of(:full_name) }

end