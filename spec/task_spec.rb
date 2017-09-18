require 'spec_helper'

describe 'Task' do
let(:task1) { Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2017-02-22'}) }

  describe(".all") do
    it("is empty at first") do
      expect(Task.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a task to the array of saved tasks") do
      task1.save()
      expect(Task.all()).to(eq([task1]))
    end
  end

  describe("#description") do
    it("lets you read the description out") do
      expect(task1.description()).to(eq("learn SQL"))
    end
  end

  describe("#list_id") do
    it("lets you read the list ID out") do
      expect(task1.list_id()).to(eq(1))
    end
  end

  describe("#due_date") do
    it "has a readable due date" do
      expect(task1.due_date).to eq '2017-02-22'
    end
  end

  describe ".sort" do
    it "will return a sort list of tasks" do
      task1.save
      task2 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2017-03-15'})
      task3 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2017-01-15'})
      task2.save
      task3.save
      p Task.sort.first
       task1 = Task.sort.first
      expect(task1.due_date).to eq "2017-02-22 00:00:00"
    end
  end

  describe("#==") do
    it("is the same task if it has the same description and list ID") do
      task2 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2017-03-15'})
      expect(task1).to(eq(task2))
    end
  end
end
