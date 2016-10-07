require 'rspec'
require_relative '../lib/ary_adapter'

describe AryAdapter do
  before :example do
    @original_complicated_object = Some::Complicated::ThirdParty::Object.new(:pepsi,:pager,:mtv)
    @ary_adapter = AryAdapter.new(@original_complicated_object)
  end
  it "should have << interace to add values" do
    @ary_adapter << [:fuck, :whores]
    expect(@ary_adapter.internal_ary).to match_array [:fuck, :whores,:pepsi,:pager,:mtv]
  end
end