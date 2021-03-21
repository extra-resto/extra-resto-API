class Api::BusinessesController < ApplicationController
  before_action :set_business, only: [:show, :update, :destroy]
  before_action :is_employer?, only: [:create]

  # GET /businesses
  def index
    @businesses = Business.all

    render json: @businesses
  end

  # GET /businesses/1
  def show
    render json: @business
  end

  # POST /businesses
  def create
    @business = Business.new(business_params)
    @business.user = current_user

    if @business.save
      render json: @business, status: :created
    else
      render json: @business.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /businesses/1
  def update
    if @business.update(business_params)
      render json: @business
    else
      render json: @business.errors, status: :unprocessable_entity
    end
  end

  # DELETE /businesses/1
  def destroy
    @business.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def business_params
      params.require(:business).permit(:name, :adress, :postal_code, :city)
    end

    def is_employer?
      unless current_user.role == "employer"
        render json: {error: ["accessible aux employeurs seulement"]}, status: :unauthorized
      end
    end
end
