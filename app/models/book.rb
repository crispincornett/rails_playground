# == Schema Information
#
# Table name: books
#
#  id          :uuid             not null, primary key
#  title       :string
#  description :text
#  deleted_at  :datetime
#
# Indexes
#
#  index_books_on_deleted_at  (deleted_at)
#

# AR model for books
class Book < ActiveRecord::Base
  acts_as_paranoid

  validates :title, presence: true
end
