class ExhibitsController < ApplicationController

  def index
    @exhibits = Exhibit.order(created_at: :desc)
  end

  def show
    @exhibit = Exhibit.find(params[:id])
  end

end