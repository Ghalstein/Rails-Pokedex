class PokemonsController < ApplicationController
  def index
  	@pokemons = Pokemon.all
  end

  def show
  	@pokemon = Pokemon.find(params[:id])
  end

  def edit
  	@pokemon = Pokemon.find(params[:id])
  end

  def new
  	@pokemon = Pokemon.new
  end

  def create
  	@pokemon = Pokemon.create(pokemon_params)
  	redirect_to pokemon_path(@pokemon)
  end

  def update
    @pokemon = Pokemon.find(params[:id])
    @pokemon.update(pokemon_params)
    redirect_to pokemon_path(@pokemon)
  end

  def destroy
  	@pokemon = Pokemon.find(params[:id])
  	@pokemon.destroy
  	redirect_to pokemons_path
  end

  
  def pokemon_params
    return params.require(:pokemon).permit(:name, :weight, :description)
  end
end