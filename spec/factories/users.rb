# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  client_id              :uuid
#  super_admin            :boolean          default(FALSE), not null
#
# Indexes
#
#  index_users_on_client_id             (client_id)
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_d3559eaf4c  (client_id => clients.id)
#

FactoryGirl.define do
  factory :user do
    client
    email                   { Faker::Internet.email }
    password                'password123'
    password_confirmation   'password123'
  end

  factory :super_admin, class: User do
    client
    email                   { Faker::Internet.email }
    password                'secret123'
    password_confirmation   'secret123'
    super_admin             true
  end
end
