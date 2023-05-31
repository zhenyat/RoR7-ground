class Admin::PlantsController < Admin::BaseController
  before_action :set_plant, only: [:show, :edit, :update, :destroy]

  def index
    @plants = policy_scope(Plant)
  end

  def show
    authorize @plant
  end

  def new
    @plant = Plant.new
    authorize @plant
  end

  def edit
    authorize @plant
  end

  def create
    @plant = Plant.new(plant_params)
    authorize @plant
    set_plant_values
    if @plant.save
      redirect_to admin_plant_path(@plant), notice: t('messages.created', model: @plant.class.model_name.human)
    else      
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize @plant
    set_plant_values
    if @plant.update(plant_params)
      redirect_to admin_plant_path(@plant), notice: t('messages.updated', model: @plant.class.model_name.human)
    else      
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @plant
    @plant.destroy
    flash[:success] = t('messages.deleted', model: @plant.class.model_name.human)
    redirect_to admin_plants_path
  end

  private

    # Uses callbacks to share common setup or constraints between actions
    def set_plant
      @plant = Plant.find(params[:id])
    end

    # Only allows a trusted parameter 'white list' through
    def plant_params
      params.require(:plant).permit(
        :name, :colors
      )
    end

    def set_plant_values
      @plant.colors = params['colors'].join(", ") # array to string
    end
end
