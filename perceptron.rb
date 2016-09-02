class Perceptron
  attr_reader :threshold, :weights, :inputs

  def initialize(attributes = {})
    @threshold = attributes[:threshold]
    @weights = attributes[:weights]
    @inputs = attributes[:inputs]
  end

  def set_threshold(n)
    @threshold = n
  end

  def set_weight(new_weight)
    @weights[new_weight.keys.first] = new_weight.values.first
  end

  def set_weights(new_weights)
    @weights = new_weights
  end

  def set_input(new_input)
    @inputs[new_input.keys.first] = new_input.values.first
  end

  def set_inputs(new_inputs)
    @inputs = new_inputs
  end

  def output
    @weights.map do |condition, weight|
      inputs[condition] * weight
    end.reduce(:+) >= @threshold
  end
end
