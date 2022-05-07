class EntityController < ApplicationController
    def index
        @entities = current_user.entities
        if(@entities.empty?)
            flash[:notice] = "No entities found"
            redirect_to new_entity_path
        end
    end

    def new
        @entity = current_user.entities.new
        @groups = current_user.groups
        if(@groups.empty?)
            flash[:notice] = "No groups found"
            redirect_to new_group_path
        end
    end

    def create
        @entity = current_user.entities.new(entity_params)
        if @entity.save
            flash[:notice] = "Entity created"
            redirect_to entity_index_path
        else
            flash[:notice] = "Entity not created"
            redirect_to new_entity_path
        end
    end

    private
    def entity_params
        params.require(:entity).permit(:name, :amount, :group_id,:user_id)
    end
end
