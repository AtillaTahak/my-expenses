class Group < ApplicationRecord
  belongs_to :user
  has_many :entities
  validates :name, presence: true, acceptance: { message: 'Should not be empty' }
  validates :icon, presence: true, acceptance: { message: 'Should not be empty' }

  def total_funds
    entities.sum(:amount)
  end

  def user_name(user_id)
    User.find(user_id).name
  end
end
