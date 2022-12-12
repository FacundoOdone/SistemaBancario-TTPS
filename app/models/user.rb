class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  
  belongs_to :branch_office,optional: true
  has_many :turn, foreign_key: true

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :rol, presence: true
end
