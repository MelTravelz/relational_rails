class Exhibits::ArtifactsController < ApplicationController
  def index
    @exhibit = Exhibit.find(params[:id])
    if params[:sort] == "alphab"
      @artifacts = @exhibit.artifacts.sort_alphabetically
    elsif  params[:total_pieces].present?
      @artifacts = @exhibit.artifacts.filter_by_total_pieces(params[:total_pieces])
    else
      @artifacts = @exhibit.artifacts 
    end
  end

  def new
    @exhibit = Exhibit.find(params[:id])
  end

  def create
    exhibit = Exhibit.find(params[:id])
    # Artifact.create!(artifact_params.merge({exhibit_id: @exhibit.id}))
    exhibit.artifacts.create!(artifact_params)
    redirect_to "/exhibits/#{exhibit.id}/artifacts"
  end

  private
   def artifact_params
    params.permit(:name, :material, :year_created, :total_pieces, :on_loan)
  end
end

# Without artifact_params this is what whould have to be typed: 
# Artifact.create!(exhibit_id: @exhibit.id,, name: params[:name], material: params[:material], year_created: params[:year_created], total_pieces: params[:total_pieces], on_loan: params[:on_loan])