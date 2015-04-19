class HackathonsController < ApplicationController
  before_action :set_hackathon, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show, :index]


  def my_hackathons
    @my_hackathons = Hackathon.where(user_id: current_user.id).future_hackathons
    @my_archived_hackathons = Hackathon.where(user_id: current_user.id).past_hackathons
  end

  def import
    
  end

  def import_hackathons
    Hackathon.import(params[:file], current_user.id)
    redirect_to my_hackathons_path
  end
  # GET /hackathons
  # GET /hackathons.json
  def index
    if params[:search]
      @hackathons = Hackathon.where(country: params[:search]).order(start_date: :asc)
    else
      @hackathons = Hackathon.ordered_by_start_date
    end
  end

  # GET /hackathons/1
  # GET /hackathons/1.json
  def show
    @nearby_hackathons = Hackathon.near([@hackathon.latitude, @hackathon.longitude], 50)
  end

  # GET /hackathons/new
  def new
    @hackathon = Hackathon.new
  end

  # GET /hackathons/1/edit
  def edit
  end

  # POST /hackathons
  # POST /hackathons.json
  def create
    @hackathon = Hackathon.new(hackathon_params)
    @hackathon.user = current_user
    respond_to do |format|
      if @hackathon.save
        format.html { redirect_to @hackathon, notice: 'Hackathon was successfully created.' }
        format.json { render :show, status: :created, location: @hackathon }
      else
        format.html { render :new }
        format.json { render json: @hackathon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hackathons/1
  # PATCH/PUT /hackathons/1.json
  def update
    respond_to do |format|
      if @hackathon.update(hackathon_params)
        format.html { redirect_to @hackathon, notice: 'Hackathon was successfully updated.' }
        format.json { render :show, status: :ok, location: @hackathon }
      else
        format.html { render :edit }
        format.json { render json: @hackathon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hackathons/1
  # DELETE /hackathons/1.json
  def destroy
    @hackathon.destroy
    respond_to do |format|
      format.html { redirect_to hackathons_url, notice: 'Hackathon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hackathon
      @hackathon = Hackathon.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hackathon_params
      params.require(:hackathon).permit(:name, :city, :organisation, :website, :start_date, :end_date, :location_name, :street, :suburb, :state, :postcode, :country, :total_prize_value, :description, :logo, :registration_link, :user_id, :tag_list)
    end
end
