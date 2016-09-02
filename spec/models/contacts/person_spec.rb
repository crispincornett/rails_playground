# == Schema Information
#
# Table name: contacts_people
#
#  id         :uuid             not null, primary key
#  user_id    :uuid             not null
#  first_name :string
#  last_name  :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_contacts_people_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_10f8f76eb2  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe Contacts::Person, type: :model do
  it "has a valid factory" do
    person = build(:person)
    expect(person).to be_valid
  end

  it { is_expected.to validate_presence_of(:user_id) }

  it "is requires at least one relevant attribute" do
    person = build(:person, first_name: '', last_name: '', email: '')
    expect(person).to_not be_valid
  end

  it "is valid with only an email" do
    person = build(:person, first_name: '', last_name: '', email: 'test@example.com')
    expect(person).to be_valid
  end

  it "is valid with only an first name" do
    person = build(:person, first_name: 'Joe', last_name: '', email: '')
    expect(person).to be_valid
  end

  it "is valid with only an last name" do
    person = build(:person, first_name: '', last_name: 'Blow', email: '')
    expect(person).to be_valid
  end

end
