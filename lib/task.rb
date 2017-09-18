class Task
  attr_reader :description, :list_id

  def initialize(attributes)
    @description = attributes.fetch(:description)
    @list_id = attributes.fetch(:list_id)
  end

  def self.all
    return_tasks = DB.exec("SELECT * FROM tasks;")
    tasks = []
    return_tasks.each do |task|
      description = task.fetch('description')
      list_id = task.fetch("list_id").to_i()
      tasks.push(Task.new({:description => description, :list_id => list_id}))
    end
    tasks
  end

  def save
    DB.exec("INSERT INTO tasks (description) VALUES ('#{@description}');")
  end

  def ==(another_task)
    self.description == another_task.description
  end
end
