module Calculator

  def high(values_hash)
    max_pair = values_hash.max_by do |key, values|
      values
    end
    max_pair
  end

  def low(values_hash)
    min_pair = values_hash.min_by do |key, values|
      values
    end
    min_pair
  end

  def avg(values_hash)
    values_hash.transform_values do |value|
      value[:success].to_f / value[:total]
    end
  end

  def min_avg(hash)
    low(avg(hash))
  end

  def max_avg(hash)
    high(avg(hash))
  end

  def combine(hash1, hash2)
    hash1.merge(hash2) do |key, games, goals|
      (goals.to_f / games).round(2)
    end
  end
end
