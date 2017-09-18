require 'spec_helper'

describe 'Task' do
let(:task1) { Task.new({:description => "learn SQL", :list_id => 1}) }

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

    describe("#==") do
    it("is the same task if it has the same description and list ID") do
      task1 = Task.new({:description => "learn SQL", :list_id => 1})
      task2 = Task.new({:description => "learn SQL", :list_id => 1})
      expect(task1).to(eq(task2))
    end
    end
end
