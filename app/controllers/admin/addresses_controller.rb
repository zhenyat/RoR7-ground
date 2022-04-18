class Admin::AddressesController < Admin::BaseController
  before_action :set_address, only: %i[ show edit update destroy ]
  before_action :set_addressables

  # GET /addresses or /addresses.json
  def index
    @addresses = policy_scope(Address)
  end

  # GET /addresses/1 or /addresses/1.json
  def show
    authorize @address
  end

  # GET /addresses/new
  def new
    @address = Address.new
    authorize @address
  end

  # GET /addresses/1/edit
  def edit
    authorize @address
  end

  # POST /addresses or /addresses.json
  def create
    @address = Address.new(address_params)
    authorize @address

    respond_to do |format|
      if @address.save
        format.html { redirect_to [:admin, @address], notice: "Address was successfully created." }
        # format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addresses/1 or /addresses/1.json
  def update
    authorize @address

    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to [:admin, @address], notice: "Address was successfully updated." }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1 or /addresses/1.json
  def destroy
    @address.destroy
    authorize @address

    respond_to do |format|
      format.html { redirect_to admin_addresses_path, notice: "Address was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    def set_addressables
      @addressables = Partner.active
      @addressable_types_list = Address.includes(:addressable).map(&:addressable_type).uniq.sort
    end

    # Only allow a list of trusted parameters through.
    def address_params
      params.require(:address).permit(
        :addressable_id, :addressable_type, :kind, :country_code,
        :destination_code, :subscriber_number, :comment, :status,
        :addressable_gid
      )
    end
end
