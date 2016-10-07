require 'rspec'
require_relative '../lib/precondition/employee'
include Precondition

describe Employee do
  before :all do
    @employee = Employee.new('Alexander',Date.strptime('01.01.16','%d.%m.%y'))
  end

  it 'should not create self without valid hire date' do
    expect {Employee.new('Alexander', nil)}.to raise_error TypeError
  end

  it 'should be not be covered by pension plan' do
    expect(@employee).not_to be_covered_by_pension_plan
  end

  it 'should show salary' do
    expect(@employee.show_salary).to match(/My salary is \d+/)
  end

  it 'should not have tie pin for 10 years of work' do
    expect(@employee).not_to be_due_for_tie_pin
  end

  context 'Oldtimer dedicated employee' do
    before :example do
      @employee = Employee.new('Alexander',Date.strptime('01.01.95','%d.%m.%y'))
      @employee.raise_salary_twice
    end
    
    it 'should have standard salary multiplied by 2' do
      expect(@employee.salary).to eq 20000
    end

    it 'should HAVE tie pin for 10 years of work' do
    expect(@employee).to be_due_for_tie_pin
    end

  end

end