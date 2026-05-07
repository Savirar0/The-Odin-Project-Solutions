class HashMap
  attr_accessor :load_factor, :capacity

  def initialize
    @load_factor = 0.75
    @capacity = 16
    @buckets = Array.new(@capacity)
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
    hash_code % @capacity
  end

  def set(keyy, value)
    if length >= @capacity * @load_factor
      old_buckets = @buckets
      @capacity *= 2
      @buckets = Array.new(@capacity)
      old_buckets.each do |bucket|
        set(bucket[0], bucket[1]) if bucket != nil
      end
    end

    index = hash(keyy)

    while @buckets[index] != nil && @buckets[index][0] != keyy
      index = (index + 1) % @capacity
    end

    @buckets[index] = [keyy, value]
  end

  def get(keyy)
    index = hash(keyy)
    
    while @buckets[index] != nil
      return @buckets[index][1] if @buckets[index][0] == keyy
      index = (index + 1) % @capacity
    end
    
    nil
  end

  def has(keyy)
    index = hash(keyy)

    while @buckets[index] != nil
      return true if @buckets[index][0] == keyy
      index = (index + 1) % @capacity
    end

    false
  end

  def remove(keyy)
    index = hash(keyy)

    while @buckets[index] != nil
      if @buckets[index][0] == keyy
        value = @buckets[index][1]
        @buckets[index] = nil
        return value
      end
      index = (index + 1) % @capacity
    end

    nil
  end

  def length
    @buckets.count { |x| !x.nil? }
  end

  def clear
    @buckets = Array.new(@capacity)
  end

  def keys
    result = []
    @buckets.each do |bucket|
      result << bucket[0] if bucket != nil
    end
    result
  end

  def values
    result = []
    @buckets.each do |bucket|
      result << bucket[1] if bucket != nil
    end
    result
  end

  def entries
    result = []
    @buckets.each do |bucket|
      result << bucket if bucket != nil
    end
    result
  end
end