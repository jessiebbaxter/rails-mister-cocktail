class CocktailsController < ApplicationController

	def index
		@cocktails = Cocktail.all
	end

	def show
		@cocktail = Cocktail.find(params[:id])
		@dose = Dose.new
	end

	def new
		@cocktail = Cocktail.new
	end

	def create
		@cocktail = Cocktail.create(name: params[:cocktail][:name], description: params[:cocktail][:description])
		redirect_to cocktail_path(@cocktail)
	end
end
