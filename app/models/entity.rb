class Entity < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :name, presence: true, acceptance: { message: 'Should not be empty' }
  validates :amount, presence: true, acceptance: { message: 'Should not be empty' }
end
