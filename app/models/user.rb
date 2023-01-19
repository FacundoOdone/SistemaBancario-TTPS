class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  enum rol: {
    admin: "admin",
    operator: "operator",
    client: "client"
  }

  belongs_to :branch_office,optional: true, dependent: :destroy
  has_many :turn, foreign_key: true, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :rol, presence: true, inclusion: ["admin","operator","client"]
  validates :branch_office, presence: true, if: :operator?

end
