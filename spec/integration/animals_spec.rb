require "swagger_helper"

RSpec.describe "Animals API", type: :request do
  path "/api/v1/animal_shelters/{id}/animals" do
    get "Retrieve animals of an animal shelter" do
      tags "Animals"
      produces "application/json"
      parameter name: :id, :in => :path, :type => :string

      response "200", "Animals found" do
        schema type: :array,
          properties: {
            id: { type: :integer, },
            animal_picture: { type: :string, },
            medical_condition: { type: :string },
            current_temporary_name: { type: :string },
            supposed_race: { type: :string, "x-nullable": true },
            is_adaptable: { type: :boolean },
          },
          required: [
            "id",
            "animal_picture",
            "medical_condition",
            "current_temporary_name",
            "is_adaptable",
          ]

        let!(:animal_shelter) { AnimalShelter.create(name: "Shelter 1") }

        let!(:bob_animal) do
          Animal.create(
            animal_picture: "picture.png",
            medical_condition: "sick",
            current_temporary_name: "Bob",
            supposed_race: "German",
            animal_shelter_id: animal_shelter.id)
        end

        let!(:tim_animal) do
          Animal.create(
            animal_picture: "picture2.png",
            medical_condition: "sick",
            current_temporary_name: "Tim",
            supposed_race: nil,
            animal_shelter_id: animal_shelter.id)
        end

        let(:id) { animal_shelter.id }
        run_test!
      end
    end
  end
end

# RSpec.describe "Animals API", type: :request do
#   describe "/api/v1/animal_shelters/:id/animals" do
#     let!(:animal_shelter) do
#       AnimalShelter.create(name: "Shelter 1")
#     end

#     context "when a shelter has animals" do
#       let!(:bob_animal) do
#         Animal.create(
#           animal_picture: "picture.png",
#           medical_condition: "sick",
#           current_temporary_name: "Bob",
#           supposed_race: "German",
#           animal_shelter_id: animal_shelter.id)
#       end

#       let!(:tim_animal) do
#         Animal.create(
#           animal_picture: "picture2.png",
#           medical_condition: "sick",
#           current_temporary_name: "Tim",
#           supposed_race: "German",
#           animal_shelter_id: animal_shelter.id)
#       end

#       it "returns list of animals with details" do
#         get "/api/v1/animal_shelters/#{animal_shelter.id}/animals"

#         expect(response).to be_successful
#         response_body = JSON.parse(response.body)
#         expect(response_body.length).to eq 2
#         expect(response_body[0]).to include(
#           "animal_picture" => bob_animal.animal_picture,
#           "medical_condition" => bob_animal.medical_condition,
#           "current_temporary_name" => bob_animal.current_temporary_name,
#           "supposed_race" => bob_animal.supposed_race,
#           "is_adaptable" => bob_animal.is_adaptable,
#         )

#         expect(response_body[1]).to include(
#           "animal_picture" => tim_animal.animal_picture,
#           "medical_condition" => tim_animal.medical_condition,
#           "current_temporary_name" => tim_animal.current_temporary_name,
#           "supposed_race" => tim_animal.supposed_race,
#           "is_adaptable" => tim_animal.is_adaptable,
#         )
#       end
#     end

#     context "when a shelter has no animals" do
#       it "returns empty list" do
#         get "/api/v1/animal_shelters/#{animal_shelter.id}/animals"

#         expect(response).to be_successful
#         response_body = JSON.parse(response.body)
#         expect(response_body).to eq []
#       end
#     end
#   end
# end
