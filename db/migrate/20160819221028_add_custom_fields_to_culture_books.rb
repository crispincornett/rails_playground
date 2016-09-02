class AddCustomFieldsToCultureBooks < ActiveRecord::Migration
  def change
    add_column :culture_books, :custom_fields, :jsonb
  end
end
