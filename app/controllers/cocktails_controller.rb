class CocktailsController < ApplicationController

	def index
		@cocktails = Cocktail.all
		@cocktails = @cocktails.sort_by { |cocktail| cocktail[:hearts] }.reverse
		
		@cocktail = Cocktail.new
	end

	def heart
		@cocktail = Cocktail.find(params[:id])
		@cocktail.hearts = @cocktail.hearts + 1
		@cocktail.save
		redirect_to cocktails_path
	end

	def show
		@cocktail = Cocktail.find(params[:id])
		@dose = Dose.new
	end

	def create
		@cocktail = Cocktail.new(cocktail_params)
		if @cocktail.save
			redirect_to cocktail_path(@cocktail)
		else
			render :new
		end
	
	end

	def cocktail_params
	  params.require(:cocktail).permit(:name, :description, :photo)
	end


end