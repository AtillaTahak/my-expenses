require 'rails_helper'

RSpec.describe Group, type: :model do
    before(:each) do
        @user = User.create(name: "Atilla")
        @group = Group.create(name: "Group 1", user_id: @user.id)
    end
    it 'should have a name' do
        @user.name = nil
        expect(@user).to_not be_valid
    end
    it 'should have a group' do
        expect(@group).to be_valid
    end
    it 'should have a user' do
        @group.user_id = nil
        expect(@group).to_not be_valid
    end
end