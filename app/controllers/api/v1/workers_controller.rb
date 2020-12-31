module Api
  module V1
    class WorkersController < ApplicationController
      before_action :set_animal_shelter

      def create
        @worker = AnimalShelterWorker.new(permitted_params)
        @worker.animal_shelter = @animal_shelter
        @worker.save
        render json: {}, status: :created
      end

      def destroy
        @worker = AnimalShelterWorker.find(params[:id])
        if @worker.animal_shelter_id == @animal_shelter.id
          @worker.delete

          render head: :no_content
        else
          render json: {error: "This worker does not belong to the Animal Shelter"}, status: :unprocessable_entity
        end
      end

      private

      def set_animal_shelter
        @animal_shelter = AnimalShelter.find(params[:animal_shelter_id])
      end

      def permitted_params
        params.permit(:name)
      end
    end
  end
end
