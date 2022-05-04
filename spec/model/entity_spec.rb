require 'rails_helper'

RSpec.describe Entity, type: :model do
    before(:each) do
        @user = User.create(name: "Atilla")
        @group = Group.create(name: "Group 1", user_id: @user.id)
        @entity = Entity.create(name: "Entity 1", group_id: @group.id, user_id: @user.id)
    end
    it 'should created entity with group and user' do
        expect(@entity).to be_valid
    end
    it 'should have a name' do
        @entity.name = nil
        expect(@entity).to_not be_valid
    end
    it 'should have a group' do
        @entity.group_id = nil
        expect(@entity).to_not be_valid
    end
    it 'should have a user' do
        @entity.user_id = nil
        expect(@entity).to_not be_valid
    end

end