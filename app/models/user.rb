class User < ApplicationRecord
  validates :name, presence: true
  validates :phone, presence: true
  validates :email, presence: true

  scope :admin, -> { where(role: 'admin') }
end
