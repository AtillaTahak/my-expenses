class GroupController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = Group.where(user_id: current_user.id).order(created_at: :asc)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id
    if @group.save
      flash[:success] = 'group created succesfully'
      redirect_to "/users/#{current_user.id}/group"
    else
      flash[:fail] = 'fails'
      render 'new'
    end
  end

  def show; end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
