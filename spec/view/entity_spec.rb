require 'rails_helper'

RSpec.describe Entity, type: :model do
  describe 'Entity model' do
    before(:each) do
      @user = User.create name: 'Tester', email: 'tester@example.com', password: '123456'
      @category = Group.create name: 'currency', icon: 'currency', user: @user
      @expenses = Entity.create name: 'Education', amount: 45, user_id: @user, category_id: 1
    end

    it 'validates name' do
      @spending.name = ''

      expect(@expenses).to_not be_valid
    end

    it 'validates amount' do
      @expenses.amount = ''

      expect(@expenses).to_not be_valid
    end

    it 'has a correct user name' do
      expect(@user.name).to eq 'Tester'
    end

    it 'has a correct type' do
      expect(@expenses.category_id).to eq 1
    end
  end
end