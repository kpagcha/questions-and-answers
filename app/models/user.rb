class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :roles, :join_table => :users_roles

  def admin?
    admin_role = Role.where("name", "=", "admin").pluck(:id)
    return self.roles.include?(admin_role)
  end
end
