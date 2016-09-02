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

class Client < ActiveRecord::Base
  has_paper_trail

  has_many :users

  validates :short_name, :full_name, presence: true
end
