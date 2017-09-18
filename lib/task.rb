class Task
  attr_reader :description

  def initialize(attributes)
    @description = attributes.fetch(:description)
  end

  def self.all
    return_tasks = DB.exec("SELECT * FROM tasks;")
    tasks = []
    return_tasks.each do |task|
      description = task.fetch('description')
      tasks.push(Task.new(:description => description))
    end
    tasks
  end
  
  def ==(another_task)
    self.description == another_task.description
  end
end
