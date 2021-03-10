class Junior < ApplicationRecord
  has_many :acces_juniors, dependent: :destroy
  has_many :users, through: :acces_juniors
end
