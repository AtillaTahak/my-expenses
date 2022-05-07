class EntityController < ApplicationController
    before_action :authenticate_user!
    before_action :set_Entity, only: %i[show edit update destroy]
  
    # GET /entities or /entities.json
    def index
      @group_id = Group.find(params[:group_id])
      @entities = Entity.where(group_id: @group_id.id)
    end
  
    # GET /entities/1 or /entities/1.json
    def show; end
  
    # GET /entities/new
    def new
      @group_id = Group.find(params[:group_id]).id
      @entity = Entity.new
    end
  
    # GET /entities/1/edit
    def edit; end
  
    # POST /entities or /entities.json
    def create
      @entity = Entity.new(entity_params)
      @entity.user_id = current_user.id
      @group = Group.find(params[:group_id])
  
      @entity.group_id = @group.id
  
      if @entity.save
         redirect_to user_group_entity_index_url(current_user, @group), notice: 'Entity was successfully created.'
      else
        render :new
      end
    end
  
    # PATCH/PUT /entities/1 or /entities/1.json
    def update
      respond_to do |format|
        if @entity.update(entity_params)
          format.html { redirect_to entity_url(@entity), notice: 'Entity was successfully updated.' }
          format.json { render :show, status: :ok, location: @entity }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @entity.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /entities/1 or /entities/1.json
    def destroy
      @entity.destroy
  
      respond_to do |format|
        format.html { redirect_to entities_url, notice: 'Entity was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_entity
      @entity = Entity.find(params[:id])
    end
  
    # Only allow a list of trusted parameters through.
    def entity_params
      params.require(:entity).permit(:name, :amount)
    end
end
