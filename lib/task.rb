class Task
  attr_reader :description, :list_id, :due_date

  def initialize(attributes)
    @description = attributes.fetch(:description)
    @list_id = attributes.fetch(:list_id)
    @due_date = attributes.fetch(:due_date)
  end

  def self.all
    return_tasks = DB.exec("SELECT * FROM tasks;")
    tasks = []
    return_tasks.each do |task|
      description = task.fetch('description')
      list_id = task.fetch("list_id").to_i()
      due_date = task.fetch("due_date")
      tasks.push(Task.new({:description => description, :list_id => list_id, :due_date => due_date}))
    end
    tasks
  end

  def save
    DB.exec("INSERT INTO tasks (description, list_id, due_date) VALUES ('#{@description}', #{@list_id}, '#{@due_date}');")
  end

  def self.sort
    return_sorted_tasks = DB.exec("SELECT * FROM tasks ORDER BY due_date ASC")
    sorted_tasks = []
    return_sorted_tasks.each do |task|
      description = task.fetch('description')
      list_id = task.fetch("list_id").to_i()
      due_date = task.fetch("due_date")
      sorted_tasks.push(Task.new({:description => description, :list_id => list_id, :due_date => due_date}))
    end
    sorted_tasks
  end

  def ==(another_task)
    self.description == another_task.description
  end
end
