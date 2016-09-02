require_relative 'perceptron'
require 'minitest/autorun'
require 'minitest/pride'

class PerceptronTest < Minitest::Test
  def test_it_has_threshold
    p = Perceptron.new(threshold: 10)
    assert_equal 10, p.threshold
  end

  def test_it_has_weights
    p = Perceptron.new(weights: {sunny: 2, car_works: 4, friends_going: 3})
    assert_equal 2, p.weights[:sunny]
    assert_equal 4, p.weights[:car_works]
    assert_equal 3, p.weights[:friends_going]
  end

  def test_attributes_can_be_empty_at_initialization
    p = Perceptron.new()
    assert_equal nil, p.threshold
    assert_equal nil, p.weights
  end

  def test_attributes_can_be_set_post_initialization
    p = Perceptron.new()
    p.set_threshold(5)
    p.set_weights({sunny: 2, car_works: 4, friends_going: 3})
    assert_equal 5, p.threshold
    assert_equal 2, p.weights[:sunny]
    assert_equal 4, p.weights[:car_works]
    assert_equal 3, p.weights[:friends_going]
  end

  def test_can_change_a_single_weight
    p = Perceptron.new(threshold: 5, weights: {sunny: 2, car_works: 4, friends_going: 3})
    assert_equal 3, p.weights[:friends_going]
    p.set_weight(friends_going: 2)
    assert_equal 2, p.weights[:friends_going]
  end

  def test_can_change_multiple_weights
    p = Perceptron.new(threshold: 5, weights: {sunny: 2, car_works: 4, friends_going: 3})
    p.set_weights({sunny: 3, car_works: 3, friends_going: 4})
    assert_equal 3, p.weights[:sunny]
    assert_equal 3, p.weights[:car_works]
    assert_equal 4, p.weights[:friends_going]
  end

  def test_can_set_inputs
    p = Perceptron.new(threshold: 5, weights: {sunny: 2, car_works: 4, friends_going: 3})
    p.set_inputs({sunny: 0, car_works: 1, friends_going: 1})
    assert_equal 0, p.inputs[:sunny]
    assert_equal 1, p.inputs[:car_works]
    assert_equal 1, p.inputs[:friends_going]
  end

  def test_computes_output_correctly
    p = Perceptron.new(threshold: 6,
        weights: {sunny: 2, car_works: 4, friends_going: 3})
    p.set_inputs({sunny: 0, car_works: 1, friends_going: 1})
    assert_equal true, p.output

    p.set_input(friends_going: 0)
    assert_equal false, p.output

    p.set_threshold(2)
    assert_equal true, p.output
  end    
end
