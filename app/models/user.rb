class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  enum rol: {
    admin: "admin",
    operator: "operator",
    client: "client"
  }

  belongs_to :branch_office,optional: true, dependent: :destroy
  has_many :turns, :foreign_key => "client_id"
  has_many :turns, :foreign_key => "staff_attended_id"

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :rol, presence: true, inclusion: ["admin","operator","client"]

end
