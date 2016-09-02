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

class Contacts::Person < ActiveRecord::Base
  has_paper_trail meta: { user_id: :user_id }
  belongs_to :user

  validates :user_id, presence: true

  validate :has_significant_attribute

  def has_significant_attribute
    if first_name.blank? && last_name.blank? && email.blank?
      errors[:base] << "Contact must have a first name, last name OR email"
    end
  end
end
