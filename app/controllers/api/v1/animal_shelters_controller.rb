module Api
  module V1
    class AnimalSheltersController < ApplicationController
      def create
        @animal_shelter = AnimalShelter.new(permitted_params)
        if @animal_shelter.save
          render json: @animal_shelter, status: :created
        else
          render json: { error: @animal_shelter.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @animal_shelter = AnimalShelter.find(params[:id])
        @animal_shelter.delete

        render head: :no_content
      end

      private

      def permitted_params
        params.require(:animal_shelter).permit(:name, :address)
      end
    end
  end
end
