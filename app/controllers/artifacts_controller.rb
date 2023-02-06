class ArtifactsController < ApplicationController

  def index
    @artifacts = Artifact.only_display_if_true
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

  def destroy
    Artifact.destroy(params[:id])
    redirect_to "/artifacts"
  end

  private
  def artifact_params
   params.permit(:name, :material, :year_created, :total_pieces, :on_loan)
 end
  
end