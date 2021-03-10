class AccesJunior < ApplicationRecord
  belongs_to :user
  belongs_to :junior
  has_one :membre, dependent: :destroy
  has_one :perm, dependent: :destroy
end
