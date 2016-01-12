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
