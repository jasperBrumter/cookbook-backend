module Api
  module V1

    class IngredientsController < ApplicationController
      before_action :authorize_access_request!, except: [:show, :index]
      before_action :set_ingredient, only: [:show, :update, :destroy]

      # GET /ingredients
      # GET /ingredients.json
      def index
        @ingredients = Ingredient.all
      end

      # GET /ingredients/1
      # GET /ingredients/1.json
      def show
      end

      # POST /ingredients
      # POST /ingredients.json
      def create
        @ingredient = Ingredient.new(ingredient_params)

        if @ingredient.save
          render :show, status: :created, location: @ingredient
        else
          render json: @ingredient.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /ingredients/1
      # PATCH/PUT /ingredients/1.json
      def update
        if @ingredient.update(ingredient_params)
          render :show, status: :ok, location: @ingredient
        else
          render json: @ingredient.errors, status: :unprocessable_entity
        end
      end

      # DELETE /ingredients/1
      # DELETE /ingredients/1.json
      def destroy
        @ingredient.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_ingredient
          @ingredient = Ingredient.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def ingredient_params
          params.require(:ingredient).permit(:name, :quantity, :recipe_id, :user_id)
        end
    end
  end
end
