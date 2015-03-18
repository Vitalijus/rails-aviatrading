class AdvertsController < ApplicationController
  before_action :set_advert, only: [:show, :edit, :update, :destroy]
  before_action :set_plan
  before_action :authenticate_user!, except: [:index, :show, :new, :create, :home, :plan]

  def plan
    @free_plan
    @premium_plan
  end

  def home
    @jets = Advert.where("aircraft_type = 'Jet'").limit(4)
    @single_pistons = Advert.where("aircraft_type = 'Single piston'").limit(4)
    @multi_pistons = Advert.where("aircraft_type = 'Multi piston'").limit(4)
    @turbo_props = Advert.where("aircraft_type = 'TurboProp'").limit(4)
    @helicopters = Advert.where("aircraft_type = 'Helicopter'").limit(4)
    @latest_adverts = Advert.order("created_at DESC").limit(3)
  end

  # GET /adverts
  # GET /adverts.json
  def index
    @q = Advert.paginate(:page => params[:page], :per_page => 20)
               .search(params[:q])

    @adverts = @q.result(distinct: true)
  end

  # GET /adverts/1
  # GET /adverts/1.json
  def show
  end

  # GET /adverts/new
  def new
    @advert = Advert.new
    @advert.photos.build
  end

  # GET /adverts/1/edit
  def edit
  end

  # POST /adverts
  # POST /adverts.json
  def create
    @advert = Advert.new(advert_params)
    current_user.adverts << @advert
    #@photos = [] 
    #params[:public_token].split(",").each do |pub_id|
    #  @photos << Photo.new(:public_token => pub_id) 
    #end 
    
    #@advert.photos =  @photos

    respond_to do |format|
      if @advert.save
        if params[:public_token]
            params[:public_token].split(",").each { |url| @advert.photos.create(public_token: url) }
        end
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

     def set_plan
        plans = Plan.all
        plans.each do |plan|
          if plan.id == 1
            @free_plan = plan
          else
            @premium_plan = plan
          end
        end
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
                                     :document, :advert_duration, photos_attributes: [:id, :image,
                                     :advert_id, :public_token])
    end
end
