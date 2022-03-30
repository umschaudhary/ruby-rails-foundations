class Task < ApplicationRecord
  belongs_to :project
  after_save :update_precent_complete if :mark_complete?
  scope :completed, -> { where(completed: true) }

  mount_uploader :task_file, TaskFileUploader

  def mark_complete?
    self.completed == true
  end

  def update_precent_complete
    project = Project.find(self.project_id)
    count_of_completed_tasks = project.tasks.completed.count
    count_of_total_tasks = project.tasks.count
    project.update!(percent_complete: Counter.calculate_percent_complete(
      count_of_completed_tasks, count_of_total_tasks))
  end


end
