class Admin::BanksController < Admin::BaseController
  before_action :set_bank, only: [:show, :edit, :update,:destroy]

  def index
    @banks = policy_scope(Bank)
  end

  def show
    authorize @bank
  end

  def new
    @bank = Bank.new
    @bank.phones.build
    authorize @bank
  end

  def edit
    authorize @bank
  end

  def create
    @bank = Bank.new(bank_params)
    authorize @bank
    if @bank.save
      redirect_to admin_bank_path(@bank), notice: t('messages.created', model: @bank.class.model_name.human)
    else      
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize @bank
    if @bank.update(bank_params)
      redirect_to admin_bank_path(@bank), notice: t('messages.updated', model: @bank.class.model_name.human)
    else      
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @bank
    @bank.destroy
    flash[:success] = t('messages.deleted', model: @bank.class.model_name.human)
    redirect_to admin_banks_path
  end

  private

    # Uses callbacks to share common setup or constraints between actions
    def set_bank
      @bank = Bank.find(params[:id])
    end

    # Only allows a trusted parameter 'white list' through
    def bank_params
      params.require(:bank).permit(
        :name, :title, :bic, :url, :comment, :status, 
        phones_attributes: [
          :id, :phoneable_id, :phoneable_type, :kind, :country_code, :destination_code, :subscriber_number, :comment, :status, :phoneable_gid
        ]
      )
    end
end
