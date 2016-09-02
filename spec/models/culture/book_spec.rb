# == Schema Information
#
# Table name: culture_books
#
#  id            :uuid             not null, primary key
#  user_id       :uuid
#  title         :string           not null
#  description   :text
#  deleted_at    :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  custom_fields :jsonb
#
# Indexes
#
#  index_culture_books_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_2bd0fee54f  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe Culture::Book, type: :model do
  it "has a valid factory" do
    book = build(:book)
    expect(book).to be_valid
  end

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:user_id) }

end
