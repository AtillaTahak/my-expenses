class GroupController < ApplicationController
    def index
    end

 

    def new 
        @user = current_user
        @group = @user.groups.new
    end
    
    def create
        @user = current_user
        @group = @user.groups.new(group_params)
        if @group.save
            redirect_to new_entity_path
        else
            render :new
        end
    end

    def show
    end

    private
    def group_params
        params.require(:group).permit(:name, :icon,:user_id)
    end
end
