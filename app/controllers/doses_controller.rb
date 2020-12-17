class DosesController < ApplicationController
  before_action :find_cocktail, except: [:destroy]

  def new
    @dose = Dose.new
    authorize @dose
    @ingredients = Ingredient.all
  end

  def create
    @dose = Dose.new(doses_params)
    authorize @dose
    @dose.cocktail = @cocktail
      if @dose.save
        redirect_to cocktail_path(@cocktail), notice: 'Ingredient and Dose were successfully added.'
      else
        render :new
      end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path
  end

  private

  def doses_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
