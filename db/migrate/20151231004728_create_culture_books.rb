class CreateCultureBooks < ActiveRecord::Migration
  def change
    create_table :culture_books, id: :uuid do |t|
      t.references :user, index: true, foreign_key: true, type: :uuid
      t.string :title, null: false
      t.text :description
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
