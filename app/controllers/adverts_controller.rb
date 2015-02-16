class AdvertsController < ApplicationController
  before_action :set_advert, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :new, :create, :home]


  def home
    @helicopters = Advert.where("aircraft_type = 'Helicopter'").limit(4)
    @jets = Advert.where("aircraft_type = 'Jet'").limit(5)
  end

  # GET /adverts
  # GET /adverts.json
  def index
    @q = Advert.order("created_at ASC")
               .paginate(:page => params[:page], :per_page => 12)
               .search(params[:q])

    @adverts = @q.result(distinct: true)

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /adverts/1
  # GET /adverts/1.json
  def show
  end

  # GET /adverts/new
  def new
    @advert = Advert.new
  end

  # GET /adverts/1/edit
  def edit
  end

  # POST /adverts
  # POST /adverts.json
  def create
    @advert = Advert.new(advert_params)

    current_user.adverts << @advert

    respond_to do |format|
      if @advert.save
        format.html { redirect_to @advert, notice: 'Advert was successfully created.' }
        format.json { render action: 'show', status: :created, location: @advert }
      else
        format.html { render action: 'new' }
        format.json { render json: @advert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adverts/1
  # PATCH/PUT /adverts/1.json
  def update
    respond_to do |format|
      if @advert.update(advert_params)
        format.html { redirect_to @advert, notice: 'Advert was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @advert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adverts/1
  # DELETE /adverts/1.json
  def destroy
    @advert.destroy
    respond_to do |format|
      format.html { redirect_to adverts_url }
      format.json { head :no_content }
      format.js   { render layout: false}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advert
      @advert = Advert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advert_params
      params.require(:advert).permit(:title, :name, :surname, :email, :advert_image,
                                     :year, :price, :currency, :make, :model, :aircraft_type,
                                     :country, :city, :engine_type, :number_of_engines, :engine_make,
                                     :engine_model, :engine_hours, :engine_notes, :tbo, :engine_power,
                                     :number_of_propellers, :propeller_make, :propeller_model, 
                                     :propeller_hours, :serial_number, :registration_number,
                                     :aircraft_hours, :landings, :nearest_airport, :aircraft_status,
                                     :last_inspection, :eu_vat, :price_on_request, :airport_code,
                                     :number_of_passengers, :aircraft_usage, :phone, :user_id, 
                                     :document)
    end
end
