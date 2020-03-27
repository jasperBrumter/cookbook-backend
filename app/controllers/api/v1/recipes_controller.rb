module Api
  module V1
    class RecipesController < ApplicationController
      before_action :authorize_access_request!, except: [:show, :index]
      before_action :set_recipe, only: [:show, :update, :destroy]

      # GET /recipes
      # GET /recipes.json
      def index
        @recipes = Recipe.all
      end

      # GET /recipes/1
      # GET /recipes/1.json
      def show
      end

      # POST /recipes
      # POST /recipes.json
      def create
        @recipe = current_user.recipe.build(recipe_params)

        if @recipe.save
          render :show, status: :created, location: @recipe
        else
          render json: @recipe.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /recipes/1
      # PATCH/PUT /recipes/1.json
      def update
        if @recipe.update(recipe_params)
          render :show, status: :ok, location: @recipe
        else
          render json: @recipe.errors, status: :unprocessable_entity
        end
      end

      # DELETE /recipes/1
      # DELETE /recipes/1.json
      def destroy
        @recipe.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_recipe
          @recipe = Recipe.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def recipe_params
          params.require(:recipe).permit(:name, :user_id, :image)
        end
    end
  end
end