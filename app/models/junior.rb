class Junior < ApplicationRecord
  has_many :acces_juniors, class_name: "acces_junior", foreign_key: "reference_id", dependent: :destroy
  has_many :users, through: :acces_juniors, source: :acces_juniors_table_foreign_key_to_users_table
end
