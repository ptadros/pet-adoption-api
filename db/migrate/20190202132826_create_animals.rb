class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :animal_picture, null: false
      t.string :medical_condition, null: false
      t.string :current_temporary_name, null: false
      t.string :supposed_race
      t.boolean :is_adaptable, null: false, default: false
      t.timestamps

      t.belongs_to :animal_shelter, foreign_key: true
      t.belongs_to :animal_lover, foreign_key: true
    end
  end
end
