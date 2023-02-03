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
    @exhibit = Exhibit.create!(name: params[:name], start_date: params[:start_date], end_date: params[:end_date], on_display: params[:on_display], price: params[:price])
  end
end
