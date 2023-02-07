class ArtifactsController < ApplicationController

  def index
    # require 'pry'; binding.pry
    if params[:sort] == "on_loan_true"
      @artifacts = Artifact.only_display_if_true
    else
      @artifacts = Artifact.all
    end
    # @artifacts = Artifact.only_display_if_true(params[:order])
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