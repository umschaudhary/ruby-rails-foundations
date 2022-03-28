class Counter
  def self.calculate_percent_complete(completed_tasks, total_taks)
    completed_tasks.to_f / total_taks.to_f * 100
  end
end
