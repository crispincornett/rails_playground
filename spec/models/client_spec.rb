# == Schema Information
#
# Table name: clients
#
#  id          :uuid             not null, primary key
#  short_name  :string(25)       not null
#  full_name   :string
#  users_count :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Client, type: :model do
  it "has a valid factory" do
    client = build(:client)
    expect(client).to be_valid
  end

  it { is_expected.to validate_presence_of(:short_name) }
  it { is_expected.to validate_presence_of(:full_name) }

end
