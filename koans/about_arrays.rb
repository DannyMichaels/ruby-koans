require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutArrays < Neo::Koan
  def test_creating_arrays
    empty_array = Array.new
    assert_equal Array, empty_array.class
    assert_equal 0, empty_array.size
  end

  def test_array_literals
    array = Array.new #creating an array variable, making it equal to an array with the Array.new syntax
    assert_equal [], array

    array[0] = 1
    assert_equal [1], array

    array[1] = 2
    assert_equal [1, 2], array

    array << 333 ##is there a .pop alternative to <<?
    assert_equal [1, 2, 333], array
    # << is inserting 333 into the end of the array of [1, 2] making it [1, 2, 333]
    # array.push 333 does the same thing
  end

  def test_accessing_array_elements
    array = [:peanut, :butter, :and, :jelly]

    assert_equal :peanut, array[0]
    assert_equal :peanut, array.first
    assert_equal :jelly, array[3]
    assert_equal :jelly, array.last
    assert_equal :jelly, array[-1]
    assert_equal :butter, array[-3]
  end

  def test_slicing_arrays
    array = [:peanut, :butter, :and, :jelly]

    assert_equal [:peanut], array[0,1]
    assert_equal [:peanut, :butter], array[0,2] #ask janice about this behaviour tomorrow
    assert_equal [:and, :jelly], array[2,2]
    assert_equal [:and, :jelly], array[2,20] #what is this behaviour
    assert_equal [], array[4,0]
    assert_equal [], array[4,100]
    assert_equal nil, array[5,0] #why is this one equal to nil but not the other ones? 
  end

  def test_arrays_and_ranges
    assert_equal Range, (1..5).class
    assert_not_equal [1,2,3,4,5], (1..5)
    assert_equal [1, 2, 3, 4, 5], (1..5).to_a #convert range to array => [1, 2, 3, 4, 5]
    assert_equal [1, 2,3 ,4], (1...5).to_a #3 dots make the difference here, goes up to -1 of number said.
  end

  def test_slicing_with_ranges
    array = [:peanut, :butter, :and, :jelly]

    assert_equal [:peanut, :butter, :and], array[0..2]
    assert_equal [:peanut, :butter] , array[0...2]
    assert_equal [:and, :jelly], array[2..-1] #REVIEW THIS BEHAVIOUR
  end

  def test_pushing_and_popping_arrays
    array = [1,2]
    array.push(:last)
#=> [1, 2, :last]
    assert_equal [1, 2, :last], array

    popped_value = array.pop 
    #popped_value => :last, .pop automatically gets rid of last element of array, however you CAN select.
    assert_equal :last, popped_value
    assert_equal [1, 2], array
  end

  def test_shifting_arrays
    array = [1,2]
    array.unshift(:first) #inserts :first to the beginning of the array
    # array => [:first, 1, 2]

    assert_equal [:first, 1, 2], array

    shifted_value = array.shift #shift gets rid of an element in the beginning of array
    assert_equal :first, shifted_value
    assert_equal [1, 2], array
  end

end
