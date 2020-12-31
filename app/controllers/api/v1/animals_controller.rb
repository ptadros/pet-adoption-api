module Api
  module V1
    class AnimalsController < ApplicationController
      before_action :set_animal, only: [:show, :destroy, :adaptable, :remove_adaptable]

      def index
        animals = Animal.where(animal_shelter_id: params[:animal_shelter_id]).all
        render json: animals, status: :ok
      end

      def create
        animal = Animal.new(animals_permitted_params)
        animal.save

        render json: {}, status: :created
      end

      def show
        render json: @animal, status: :ok
      end

      def destroy
        # remove the animal from the shelter.
        # We can also add another field deleted_at to keep track of the timeline of actions
        @animal.update(ansimal_shelter_id: null)

        render head: :no_content
      end

      def adopting_persons
        render @animal.animal_lover, status: :ok
      end

      def adaptable
        @animal.update(is_adaptable: true, animal_lover_id: params[:animal_lover_id])
        render json: { message: "Animal is marked as adaptable" }, status: :ok
      end

      def remove_adaptable
        @animal.update(is_adaptable: false, animal_lover_id: null)
        render json: { message: "The pending adoption request for an animal is removed successfully" },
          status: :ok
      end

      private

      def set_animal
        @animal = Animal.find(params[:id])
        # TODO: verify that this animal belongs to the given shelter. Otherwise, render an error
      end

      def animals_permitted_params
        params.
          require(:animal).
          permit(:animal_picture, :medical_condition, :current_temporary_name, :supposed_race)
      end
    end
  end
end
