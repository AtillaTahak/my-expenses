require 'rails_helper'
RSpec.describe User, type: :model do
  subject { User.new(name: 'Atilla') }

  before { subject.save }
  it 'name should be in ' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'if name empy should be validation' do
    expect(User.new).to_not be_valid
  end
end
