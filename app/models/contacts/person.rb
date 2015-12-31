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
  belongs_to :user
end
