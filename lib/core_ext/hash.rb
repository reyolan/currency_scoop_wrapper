class Hash
  def to_struct
    struct = Struct.new(*keys.map(&:to_sym))
    result = map do |_k, value|
      case value
      when Hash then value.to_struct
      when Array then value.map { |val| val.is_a?(Hash) ? val.to_struct : val }
      else value
      end
    end
    struct.new(*result)
  end
end
