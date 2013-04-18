class Role < ActiveRecord::Base
  OWNER = 1
  EMPLOYEE = 2

  attr_accessible :user_id, :project_id, :role
  
  belongs_to :user
  belongs_to :project

  def owner?
    role == OWNER
  end
end
