class Admin::DetailSetsController < Admin::BaseController
  before_action :set_detail_set, only: %i[ show edit update destroy ]
  before_action :set_detailables

  # GET /details or /details.json
  def index
    @detail_sets = policy_scope(DetailSet)
  end

  # GET /detail_sets/1 or /detail_sets/1.json
  def show
    authorize @detail_set
  end

  # GET /detail_sets/new
  def new
    @detail_set = DetailSet.new
    authorize @detail_set
  end

  # GET /detail_sets/1/edit
  def edit
    authorize @detail_set
  end

  # POST /detail_sets or /detail_sets.json
  def create
    @detail_set = DetailSet.new(detail_set_params)
    authorize @detail_set

    respond_to do |format|
      if @detail_set.save
        format.html { redirect_to [:admin, @detail_set], notice: "DetailSet was successfully created." }
        # format.json { render :show, status: :created, location: @detail_set }
      else
        format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @detail_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detail_sets/1 or /detail_sets/1.json
  def update
    authorize @detail_set

    respond_to do |format|
      if @detail_set.update(detail_set_params)
        format.html { redirect_to [:admin, @detail_set], notice: "DetailSet was successfully updated." }
        # format.json { render :show, status: :ok, location: @detail_set }
      else
        format.html { render :edit, status: :unprocessable_entity }
        # format.json { render json: @detail_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detail_sets/1 or /detail_sets/1.json
  def destroy
    authorize @detail_set
    @detail_set.destroy

    respond_to do |format|
      format.html { redirect_to admin_detail_sets_path, notice: "DetailSet was successfully destroyed." }
      # format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_detail_set
    @detail_set = DetailSet.find(params[:id])
  end

  def set_detailables
    @detailables = Partner.active
    @detailable_types_list = DetailSet.includes(:detailable).map(&:detailable_type).uniq.sort
  end

  # Only allow a list of trusted parameters through.
  def detail_set_params
    params.require(:detail_set).permit(
      :detailable_id, :detailable_type, :inn, :kpp, :ogrn, :ogrnip,
      :okato, :certificate_number, :certificate_date, :comment, :status,
      :detailable_gid
    )
  end

  def dummy
    begin
      puts "hi"
    rescue
      puts "NO"
    end
  end
end
