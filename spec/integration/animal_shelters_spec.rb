require "swagger_helper"

describe "AnimalShelter API", type: :request do
  path "/api/v1/animal_shelters" do
    post "Creates an animal shelter" do
      tags "Shelters"
      consumes "application/json"
      parameter name: :animal_shelter, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: [ "name"]
      }

      response "201", "Animal shelter created" do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            name: { type: :string },
          },
          required: [ "id", "name" ]

        let(:animal_shelter) { { name: "Shelter 1" } }
        run_test!
      end

      response "422", "invalid request" do
        let(:animal_shelter) { { name: nil } }
        run_test!
      end
    end
  end
end

# describe "AnimalShelter API", type: :request do
#   describe "POST /api/v1/animal_shelters" do
#     let(:request_params) do
#       { animal_shelter: { name: "Shelter 1" } }
#     end

#     subject(:create_shelter_request) do
#       post "/api/v1/animal_shelters", params: request_params, headers: ["application/json"]
#     end

#     it "creates a new animal shelter with the given params" do
#       create_shelter_request

#       expect(response).to be_successful
#       expect(AnimalShelter.count).to eq 1
#       expect(AnimalShelter.first).to have_attributes(
#         name: request_params[:animal_shelter][:name]
#       )
#     end

#     context "when missing params" do
#       it "returns an error with status code 422 if the name is missing" do
#         request_params[:animal_shelter][:name] = nil
#         create_shelter_request

#         expect(response).to be_unprocessable
#         expect(response.body).to include("Name can't be blank")
#       end
#     end
#   end
# end
