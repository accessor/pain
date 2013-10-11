class PropertiesController < ApplicationController
  load_and_authorize_resource :except => [:autocomplete_location_city]
  before_filter :authenticate_user!, :except => [:index, :autocomplete_location_city]
  before_filter :set_current_user
  autocomplete :location, :city, :full => true
  # GET /properties
  # GET /properties.json
  def index
    Property.first
    params[:q] = view_context.convert_price_to_price_cents(params[:q])
    @properties = property_type.search(params[:q]).result.order('created_at desc').page(params[:page]).per(5)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @properties }
    end
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
    @property = property_type.find(params[:id])
    @address = @property.address
    @gmap_json = @address.to_gmaps4rails

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @property }
    end
  end

  # GET /properties/new
  # GET /properties/new.json
  def new
    @property = property_type.new
    @property.build_address
    @property.build_image
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @property }
    end
  end

  # GET /properties/1/edit
  def edit
    @property = property_type.find(params[:id])
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = property_type.new(params[property_params])

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render json: @property, status: :created, location: @property }
      else
        format.html { render action: "new" }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /properties/1
  # PUT /properties/1.json
  def update
    @property = property_type.find(params[:id])

    respond_to do |format|
      if @property.update_attributes(params[property_params])
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property = property_type.find(params[:id])
    @property.destroy

    respond_to do |format|
      format.html { redirect_to properties_url }
      format.json { head :no_content }
    end
  end

  private

  def property_type
    params[:type].constantize
  end
  
  def property_params
    params[:type].underscore.to_sym
  end
end
