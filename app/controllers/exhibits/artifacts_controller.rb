class Exhibits::ArtifactsController < ApplicationController
  def index
    @exhibit = Exhibit.find(params[:id])
    @artifacts = @exhibit.artifacts 
  end
end