class CreateAnimalShelters < ActiveRecord::Migration[5.2]
  def change
    create_table :animal_shelters do |t|
      t.string :name, null: false
      t.string :address

      t.timestamps
    end
  end
end
