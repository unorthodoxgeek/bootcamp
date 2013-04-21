class Task < ActiveRecord::Base
  has_paper_trail
  
  attr_accessible :title, :description, :assignee_id, :project_id

  belongs_to :project, touch: true
  belongs_to :assignee, class_name: "User"
  has_many :assets, as: :owner
  has_many :comments
end
