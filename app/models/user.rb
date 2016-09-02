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

class User < ActiveRecord::Base
  has_paper_trail meta: { client_id: :client_id },
    ignore: [:sign_in_count, :current_sign_in_at, :current_sign_in_ip,
            :last_sign_in_at, :last_sign_in_ip, :updated_at]

  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
          :trackable, :validatable, :confirmable, :lockable

  belongs_to :client, counter_cache: true

  has_many :contacts_people, class_name: 'Contacts::Person'
  has_many :books, class_name: 'Culture::Book'
end
