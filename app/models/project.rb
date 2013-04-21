class Project < ActiveRecord::Base
  attr_accessible :name, :description, :owner_id, :logo

  belongs_to :owner, class_name: "User"
  has_many :tasks

  mount_uploader :logo, AvatarUploader

  after_create :assign_owner_role

  def set_owner!(user)
    Role.create(user_id: user.id, project_id: id, role: Role::OWNER) unless user.owns?(self)
  end

  private

  def assign_owner_role
    set_owner!(owner) if owner
  end
end
