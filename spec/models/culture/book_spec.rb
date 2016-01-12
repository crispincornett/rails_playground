require 'rails_helper'

RSpec.describe Culture::Book, type: :model do
  it "has a valid factory" do
    book = build(:book)
    expect(book).to be_valid
  end

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:user_id) }

end