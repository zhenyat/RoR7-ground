class Admin::PartnersController < Admin::BaseController
  before_action :set_phone, only: %i[ show edit update destroy ]
  before_action :set_phoneables

  # GET /phones or /phones.json
  def index
    @phones = policy_scope(Phone)
  end

  # GET /phones/1 or /phones/1.json
  def show
    authorize @phone
  end

  # GET /phones/new
  def new
    @phone = Phone.new
    authorize @phone
  end

  # GET /phones/1/edit
  def edit
    authorize @phone
  end

  # POST /phones or /phones.json
  def create
    @phone = Phone.new(phone_params)
    authorize @phone

    respond_to do |format|
      if @phone.save
        format.html { redirect_to [:admin, @phone], notice: "Phone was successfully created." }
        # format.json { render :show, status: :created, location: @phone }
      else
        format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phones/1 or /phones/1.json
  def update
    authorize @phone

    respond_to do |format|
      if @phone.update(phone_params)
        format.html { redirect_to [:admin, @phone], notice: "Phone was successfully updated." }
        # format.json { render :show, status: :ok, location: @phone }
      else
        format.html { render :edit, status: :unprocessable_entity }
        # format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phones/1 or /phones/1.json
  def destroy
    authorize @phone
    @phone.destroy

    respond_to do |format|
      format.html { redirect_to admin_phones_path, notice: "Phone was successfully destroyed." }
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phone
      @phone = Phone.find(params[:id])
    end

    def set_phoneables
      @phoneables = Partner.active
      @phoneable_types_list = Phone.includes(:phoneable).map(&:phoneable_type).uniq.sort

      # @phoneables_collection = 
      #      (Bank.all.map{|x| [x.name,    "Bank:#{x.id}"]} +
      #   Partner.all.map{|x| [x.name, "Partner:#{x.id}"]} +
      #   Company.all.map{|x| [x.name, "Company:#{x.id}"]}).sort
    end

    # Only allow a list of trusted parameters through.
    def phone_params
      params.require(:phone).permit(:phoneable_id, :phoneable_type, :kind, :country_code, :destination_code, :subscriber_number, :comment, :status, :phoneable_gid)
    end
end
