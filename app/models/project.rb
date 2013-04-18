class Project < ActiveRecord::Base
  # attr_accessible :title, :body

  def set_owner!(user)
    Role.create(user_id: user.id, project_id: id, role: Role::OWNER) unless user.owns?(self)
  end
end
