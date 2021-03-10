class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :acces_juniors, class_name: "acces_junior", foreign_key: "reference_id", dependent: :destroy
  has_many :juniors, through: :acces_juniors, source: :acces_juniors_table_foreign_key_to_juniors_table
end
