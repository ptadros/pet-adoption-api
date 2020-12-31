class CreateAnimalLovers < ActiveRecord::Migration[5.2]
  def change
    create_table :animal_lovers do |t|
      t.string :name, null: false
      t.string :phone_number, null: false
      t.string :email, null: false

      t.timestamps
    end
  end
end
