require "./spec_helper"
include Stopwatch

t = Timer.new
3.times do
  t.mark
  sleep 0.05
end

describe "Stopwatch" do
  it "test_total" do
    t.total.>(0).should be_truthy
  end

  it "test_clock_display" do
    t.h.=~(/\A\d{2}:\d{2}:\d{2}\z/).should be_truthy
  end

  it "test_times_exist" do
    t.time?.should be_truthy
  end

  it "test_it_marks_numbers_of_time_progress" do
    t.times.size.should eq(2)
  end

  it "test_times_are_greater_than_zero" do
    t.times.all? { |t| t > 0.00001 }.should be_truthy
  end

  it "test_times_are_floats" do
    t.times.all? { |t| t.is_a? Float64 }.should be_truthy
  end

  it "raises an exception" do
    x = Timer.new
    expect_raises { x.average }
  end
end
