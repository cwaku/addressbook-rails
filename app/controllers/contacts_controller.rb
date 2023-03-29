# frozen_string_literal: true

class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show edit update destroy]

  # GET /contacts or /contacts.json
  def index
    filtered = current_user.contacts.order(:firstname)

    filtered_names = Contact.where('firstname LIKE ? OR lastname LIKE ?', "%#{params[:filter]}%",
                                   "%#{params[:filter]}%")

    # Use the ransack gem for searching and filtering
    # filtered contacts that falls between the dates using ransack
    @q = Contact.ransack(params[:q])

    # set multiple varaiables to one variable
    filtered = @q.result(distinct: true) if params[:q].present?
    filtered = filtered_names if params[:filter].present?

    # Filter by  name, region, city, suburb firstname or date
    @pagy, @contacts = pagy(filtered.all, items: 10)
  end

  # GET /contacts/1 or /contacts/1.json
  def show; end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
    @selected_region = @contact.suburb.city.region
    @selected_city = @contact.suburb.city
    @selected_suburb = @contact.suburb
  end

  # POST /contacts or /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save!
        format.html { redirect_to contacts_url, flash: { success: 'Contact was successfully created.' } }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1 or /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to contact_url(@contact), flash: { success: 'Contact was successfully updated.' } }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1 or /contacts/1.json
  def destroy
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to contacts_url, flash: { success: 'Contact was successfully destroyed.' } }
      format.json { head :no_content }
      format.turbo_stream { redirect_to contacts_url }
      # format.turbo_stream { render turbo_stream: turbo_stream.replace(@contact, partial: 'contacts/contact', locals: { contact: @contact }) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = Contact.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def contact_params
    params.require(:contact).permit(:firstname, :lastname, :phone, :remarks, :user_id, :suburb_id, :city_id, :region_id)
  end

  def self.permission
    'Contact'
  end
end
