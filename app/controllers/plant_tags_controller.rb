class PlantTagsController < ApplicationController
  def new
    @plant_tag = PlantTag.new
    @plant = Plant.find(params[:plant_id])
  end

  def create
    @plant = Plant.find(params[:plant_id])
    @tags = Tag.where(id: params[:plant_tag][:tag])
    @tags.each do |tag|
      plant_tag = PlantTag.new(plant: @plant, tag: tag)
      unless plant_tag.save
        @plant_tag = PlantTag.new
        render :new, status: :unprocessable_entity
        return
        # redirect_to new_plant_plant_tag_path(@plant), alert: plant_tag.errors.messages
      end
    end
    redirect_to garden_path(@plant.garden)
    # if @plant_tag.save
    #   redirect_to garden_path(@plant.garden)
    # else
    #   render :new, status: :unprocessable_entity
    # end
  end
end
