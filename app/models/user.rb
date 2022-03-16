class User < ApplicationRecord
  has_many :categories
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  def admin?(requested_role)
    role == requested_role.to_s
  end
end
