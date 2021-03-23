class CandidaturesController < ApplicationController
  before_action :set_candidature, only: [:show, :update, :destroy]

  # GET /candidatures
  def index
    @candidatures = Candidature.all

    render json: @candidatures
  end

  # GET /candidatures/1
  def show
    render json: @candidature
  end

  # POST /candidatures
  def create
    @candidature = Candidature.new(candidature_params)

    if @candidature.save
      render json: @candidature, status: :created, location: @candidature
    else
      render json: @candidature.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /candidatures/1
  def update
    if @candidature.update(candidature_params)
      render json: @candidature
    else
      render json: @candidature.errors, status: :unprocessable_entity
    end
  end

  # DELETE /candidatures/1
  def destroy
    @candidature.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidature
      @candidature = Candidature.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def candidature_params
      params.require(:candidature).permit(:users_id, :jobs_id)
    end
end
