class PlantsController < ApplicationController
  def create
    # Find the garden
    @garden = Garden.find(params[:garden_id])
    # Create the plant with (strong) params of the form
    @plant = Plant.new(plant_params)
    # Assign garden to the plant
    @plant.garden = @garden
    # Save the plant
      # If save redirect to garden show
    if @plant.save
      redirect_to garden_path(@garden)
    # Else, re-render the form
    else
      # redirect_to garden_path(@garden)
      render "gardens/show", status: :unprocessable_entity
    end
  end

  def destroy
    # Find the plant
    @plant = Plant.find(params[:id])
    # Destroy the plant
    @plant.destroy
    # Redirect to garden show
    redirect_to garden_path(@plant.garden), status: :see_other
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :image_url)
  end
end
