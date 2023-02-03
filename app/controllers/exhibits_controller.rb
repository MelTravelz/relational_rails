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

end
