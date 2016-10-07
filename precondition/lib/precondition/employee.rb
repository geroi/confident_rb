require 'date'
module Precondition
  class Employee

    attr_accessor :name
    attr_reader :hire_date, :salary

    def initialize(name, hire_date)
      @name = name
      self.hire_date = hire_date #присвоение даты через метод-сеттер, метод определен с прекондицией - не дает присвоить ничего, кроме даты
      @salary = 10000
    end

    def hire_date=(new_hire_date)
      raise TypeError, "Invalid hire date" unless new_hire_date.is_a?(Date)
      @hire_date = new_hire_date
    end

    def due_for_tie_pin?
      ((Date.today - hire_date) / 365).to_i >= 10
    end

    def covered_by_pension_plan?
      hire_date.year < 2000
    end

    def bio
      "#{name} has been a Yoyodyne employee since #{hire_date.year}"
    end

    def show_salary
      "My salary is #{salary}"
    end

    def raise_salary_twice
      @salary *= 2
    end
  end
end