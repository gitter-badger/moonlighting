class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.string :location
      t.string :phone_number
      t.string :country_code
      t.string :languages
      t.integer :birth_year

      t.timestamps
    end
  end
end
