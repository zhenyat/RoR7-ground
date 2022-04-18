class Admin::PartnersController < Admin::BaseController
  before_action :set_partner, only: %i[ show edit update destroy ]

  def index
    @partners = policy_scope(Partner)
  end

  def show
    authorize @partner
  end

  # GET /partners/new
  def new
    @partner = Partner.new
    # @address = @partner.addresses.build
    # @detail  = @partner.detail_sets.build
    # @email   = @partner.emails.build
    @phone   = @partner.phones.build
    authorize @partner
  end

  # GET /partners/1/edit
  def edit
    authorize @partner
  end

  # POST /partners or /partners.json
  def create
    @partner = Partner.new(partner_params)
    authorize @partner

    respond_to do |format|
      if @partner.save
        format.html { redirect_to [:admin, @partner], notice: "Partner was successfully created." }
        # format.json { render :show, status: :created, location: @partner }
      else
        format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /partners/1 or /partners/1.json
  def update
    authorize @partner
    
    respond_to do |format|
      if @partner.update(partner_params)
        format.html { redirect_to [:admin, @partner], notice: "Partner was successfully updated." }
        # format.json { render :show, status: :ok, location: @partner }
      else
        format.html { render :edit, status: :unprocessable_entity }
        # format.json { render json: @partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /partners/1 or /partners/1.json
  def destroy
    authorize @partner
    @partner.destroy

    respond_to do |format|
      format.html { redirect_to admin_partners_path, notice: "Partner was successfully destroyed." }
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_partner
      @partner = Partner.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def partner_params
      params.require(:partner).permit(
        :name, :code, :title, :kind, :role, :url, :comment, :status,
        addresses_attributes: [
          :id, :addressable_type, :addressable_id, :kind, :postal_code, :region, 
          :city, :street, :comment, :status
        ],
        detail_sets_attributes: [
          :id, :detailable_type, :detailable_id, :inn, :kpp, :ogrn, :ogrnip,
          :okpo, :okato, :certificate_number, :certificate_date, :comment, :status
        ],
        emailes_attributes: [
          :id, :emailable_type, :emailable_id, :kind, :address, :comment, :status
        ],
        phones_attributes: [
          :id, :phoneable_type, :phoneable_id, :kind, :country_code,
          :destination_code, :subscriber_number, :comment, :status
        ],
      )
    end
end
