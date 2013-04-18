class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  
  has_many :roles, conditions: {role: Role::OWNER}

  has_many :projects, through: :roles

  def owns?(project)
    #role = Role.where(user_id: id, project_id: project.id).first
    #role && role.owner?
    project_ids.include?(project.id)
  end
end
