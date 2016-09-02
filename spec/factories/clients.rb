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

FactoryGirl.define do
  factory :client do
    short_name    { Faker::Company.name.split(' ')[0].gsub(/,/, '').downcase }
    full_name     { Faker::Company.name }
  end
end
