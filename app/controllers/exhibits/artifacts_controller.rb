class Exhibits::ArtifactsController < ApplicationController
  def index
    @exhibit = Exhibit.find(params[:exhibit_id])
    @artifacts = @exhibit.artifacts 
  end
end