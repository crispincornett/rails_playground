class CreateContactsPeople < ActiveRecord::Migration
  def change
    create_table :contacts_people, id: :uuid do |t|
      t.references :user, index: true, foreign_key: true, type: :uuid, null: false
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps null: false
    end
  end
end
