class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:home, :index]
  skip_after_action :verify_authorized, only: [:home]

  def home
  end

  def index
    # @cocktails = Cocktail.all
    @cocktails = policy_scope(Cocktail).order(created_at: :desc)
    if params[:query].present?
      @cocktails = Cocktail.search_by_name(params[:query])
    end
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
    authorize @cocktail
  end

  def edit
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    authorize @cocktail
    if @cocktail.save
      redirect_to @cocktail, notice: 'Cocktail was successfully created.'
    else
      render :new
    end
  end

  def update
    if @cocktail.update(cocktail_params)
      redirect_to @cocktail, notice: 'Cocktail was successfully updated.'
    else
      render :edit
    end
  end

  def search
    @cocktails = Cocktail.where(title: params[:search])
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
    authorize @cocktail
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo, :search)
  end
end
