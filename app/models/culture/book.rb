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

class Culture::Book < ActiveRecord::Base
  has_paper_trail meta: { user_id: :user_id }
  acts_as_paranoid

  DEFAULT_CUSTOM_FIELDS = { author: nil, publish_date: nil, rating: nil }

  belongs_to :user

  validates :title, :user_id, presence: true
end
