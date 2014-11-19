class User < ActiveRecord::Base
  # rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :role

  # has_and_belongs_to_many :roles, :join_table => :users_roles

  Roles = [ :admin, :default ]

  def is? requested_role
    self.role == requested_role.to_s
  end

  def admin_role
    return Roles[0]
  end

  def default_role
    return Roles[1]
  end
end