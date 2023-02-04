class ExhibitsController < ApplicationController

  def index
    @exhibits = Exhibit.order_by_most_recently_created
    #If used this line the class method wouldn't be necessary: order_by_most_recently_created 
    # @exhibits = Exhibit.order(created_at: :desc)
  end

  def show
    @exhibit = Exhibit.find(params[:id])
    @artifact_count = @exhibit.count_of_artifacts
  end

  def new
  end

  def create
    # This is one way to do this -> OR create the helper method below and jump to next line.
    # exhibit = Exhibit.create!(name: params[:name], on_display: params[:on_display], price: params[:price])
    exhibit = Exhibit.create!(exhibit_params)
    redirect_to "/exhibits"
  end

  def exhibit_params
    params.permit(:name, :on_display, :price)
  end
end
