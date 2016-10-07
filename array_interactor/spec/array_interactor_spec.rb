require 'rspec'
require_relative '../lib/array_interactor'

describe ArrayInteractor do
  before :example do
    @a = [1,2,3,4,5,6]
    @b = [5,6,7,8,9,0]
  end

  it 'should not accept non-array elems' do
    expect {ArrayInteractor.same(@a.to_s,@b.to_s)}.to raise_error ArgumentError
  end

  it 'must have ability to show diff between arrays' do
    expect(ArrayInteractor.difference(@a,@b)).to match_array [1,2,3,4,7,8,9,0]
  end

  it 'should show the similar objects in 2 arrays' do
    expect(ArrayInteractor.same(@a,@b)).to match_array [5,6]
  end

  context 'multiplicator' do
    before :example do
      @ai = ArrayInteractor.new()
    end

    it 'should not accept non-numeric values as a multiplicator' do
      expect { @ai.multiply('hello') }.to raise_error ArgumentError
    end

    it 'should multiple self by multiplicator' do
      expect(@ai.multiply(2)).to match_array [2,4,6,8,10,12,14,16,18,20]
    end
  end
end