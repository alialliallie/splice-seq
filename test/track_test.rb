require 'test_helper'

describe Track do
  it 'generates silence by default' do
    Track.new.take(8).wont_include(true)
    Track.new.take(8).must_include(false)
  end

  it 'loops patterns' do
    Track.new('-x-x').take(8).must_equal(
      [false, true, false, true, false, true, false, true]
    )
  end
end
