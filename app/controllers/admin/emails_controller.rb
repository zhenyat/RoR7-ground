class Admin::EmailsController < Admin::BaseController
  before_action :set_email, only: %i[ show edit update destroy ]
  before_action :set_emailables

  # GET /emails or /emails.json
  def index
    @emails = policy_scope(Email)
  end

  # GET /emails/1 or /emails/1.json
  def show
    authorize @email
  end

  # GET /emails/new
  def new
    @email = Email.new
    authorize @email
  end

  # GET /emails/1/edit
  def edit
    authorize @email
  end

  # POST /emails or /emails.json
  def create
    @email = Email.new(email_params)
    authorize @email

    respond_to do |format|
      if @email.save
        format.html { redirect_to [:admin, @email], notice: "Email was successfully created." }
        # format.json { render :show, status: :created, location: @email }
      else
        format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emails/1 or /emails/1.json
  def update
    authorize @email

    respond_to do |format|
      if @email.update(email_params)
        format.html { redirect_to [:admin, @email], notice: "Email was successfully updated." }
        # format.json { render :show, status: :ok, location: @email }
      else
        format.html { render :edit, status: :unprocessable_entity }
        # format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emails/1 or /emails/1.json
  def destroy
    authorize @email
    @email.destroy

    respond_to do |format|
      format.html { redirect_to admin_emails_path, notice: "Email was successfully destroyed." }
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = Email.find(params[:id])
    end

    def set_emailables
      @emailables = Partner.active
      @emailable_types_list = Email.includes(:emailable).map(&:emailable_type).uniq.sort
    end

    # Only allow a list of trusted parameters through.
    def email_params
      params.require(:email).permit(
        :emailable_id, :emailable_type, :kind, :address,
        :comment, :status, :emailable_gid
      )
    end
end
