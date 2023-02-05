class ArtifactsController < ApplicationController

  def index
    @artifacts = Artifact.all
  end

  def show
    @artifact = Artifact.find(params[:id])
  end

  def edit
    @artifact = Artifact.find(params[:id])
  end

  def update
    @artifact = Artifact.find(params[:id])
    @artifact.update(artifact_params)
    redirect_to "/artifacts/#{@artifact.id}"
  end

  private
  def artifact_params
   params.permit(:name, :material, :year_created, :total_pieces, :on_loan)
 end
  
end