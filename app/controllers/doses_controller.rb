class DosesController < ApplicationController

	def create
		@cocktail = Cocktail.find(params[:cocktail_id])
		@dose = Dose.new(description: params[:dose][:description], ingredient_id: params[:dose][:ingredient_id])
		@dose.cocktail_id  = @cocktail.id
		@dose.save

		redirect_to cocktail_path(@cocktail)
	end

	def destroy
		# raise
		@cocktail = Cocktail.find(params[:cocktail_id])
		@dose = Dose.find(params[:id])
		@dose.destroy

		redirect_to cocktail_path(@cocktail)
	end
end
