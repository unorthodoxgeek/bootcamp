class Task < ActiveRecord::Base
  attr_accessible :title, :description, :assignee_id, :project_id

  belongs_to :project
end
