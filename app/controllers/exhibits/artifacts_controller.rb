class Exhibits::ArtifactsController < ApplicationController
  def index
    @exhibit = Exhibit.find(params[:id])
    @artifacts = @exhibit.artifacts 
  end

  def new
    @exhibit = Exhibit.find(params[:id])
  end

  def create
    @exhibit = Exhibit.find(params[:id])
    Artifact.create!(artifact_params.merge({exhibit_id: @exhibit.id}))
    redirect_to "/exhibits/#{@exhibit.id}/artifacts"
  end

  private
   def artifact_params
    params.permit(:name, :material, :year_created, :total_pieces, :on_loan)
  end
end

# Artifact.create!(artifact_params[:exhibit_id] = @exhibit.id)
# Artifact.create!(exhibit_id: @exhibit.id,, name: params[:name], material: params[:material], year_created: params[:year_created], total_pieces: params[:total_pieces], on_loan: params[:on_loan])