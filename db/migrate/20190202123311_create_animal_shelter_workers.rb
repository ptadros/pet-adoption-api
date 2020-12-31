class CreateAnimalShelterWorkers < ActiveRecord::Migration[5.2]
  def change
    create_table :animal_shelter_workers do |t|
      t.string :name, null: false
      t.belongs_to :animal_shelter, foreign_key: true

      t.timestamps
    end
  end
end
