class AdvertsController < ApplicationController
  before_action :set_advert, only: [:show, :edit, :update, :show_advert, :destroy]
  before_action :set_plan
  before_action :authenticate_user!, except: [:index, :show, :pricing]
  require 'will_paginate/array'

  def pricing
    @basic_plan
    @premium_plan
  end

  def show_advert
      if @advert.show_advert == true
        if @advert.update_attributes(show_advert: false)
          respond_to do |format|
            format.html { redirect_to :back, notice: "Advert is hidden now" }
            format.json { head :no_content }
            format.js   { render layout: false}
          end
        end
      elsif @advert.show_advert == false
        if @advert.update_attributes(show_advert: true)
          respond_to do |format|
            format.html { redirect_to :back, notice: "Advert is shown now" }
            format.json { head :no_content }
            format.js   { render layout: false}
          end
        end
      else
         redirect_to :back, notice: "Sorry something went wrong" 
      end
  end

  # GET /adverts
  # GET /adverts.json
  def index
    ransack = Advert.search(params[:q]).result(distinct: true)
    @adverts = ransack.find(:all, 
                            joins: :user, 
                            conditions: { users: { active_account: true }, 
                            adverts: {show_advert: true} },
                            order: {created_at: :desc})
                            .paginate(:page => params[:page], :per_page => 16)
  end

  # GET /adverts/1
  # GET /adverts/1.json
  def show
    @adverts = Advert.all
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

    respond_to do |format|
      if @advert.save
        if params[:images]
          params[:images].each do |image|
            @advert.photos.create(image: image)
          end
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
        if params[:images]
          params[:images].each do |image|
            @advert.photos.create(image: image)
          end
        end
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
            @basic_plan = plan
          else
            @premium_plan = plan
          end
        end
      end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advert_params
      params.require(:advert).permit(:title, :name, :email, :advert_image,
                                     :year, :price, :currency, :make, :model, :aircraft_type,
                                     :country, :city, :engine_type, :number_of_engines, :engine_make,
                                     :engine_model, :engine_hours, :engine_notes, :tbo, :engine_power,
                                     :number_of_propellers, :propeller_make, :propeller_model, 
                                     :propeller_hours, :serial_number, :registration_number,
                                     :aircraft_hours, :landings, :nearest_airport, :aircraft_status,
                                     :last_inspection, :price_on_request, :airport_code,
                                     :number_of_passengers, :aircraft_usage, :phone, :user_id,
                                     :show_advert, :avionics, :interior, :exterior, :add_info,
                                     :engine_power_unit, photos_attributes: [:id, :image, 
                                     :advert_id, :public_token])
    end
end
