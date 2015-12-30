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
  has_many :users
end
