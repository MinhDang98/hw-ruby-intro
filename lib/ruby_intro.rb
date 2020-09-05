# When done, submit this entire file to the autograder.

# Part 1
def sum arr
  arr.inject(0, :+)
end

def max_2_sum arr
  if arr.length == 0
    return 0
  elsif arr.length == 1
    return arr.at(0)
  else
    @largest = -999999
    @second_largest = -999999
    @index = 0
    arr.each_with_index { |value, index|
      if value > @largest
        @largest = value
        @index = index
      end
      
      if value > @second_largest && (value != @largest || index != @index)
        @second_largest = value
      end
    }
    return @largest + @second_largest
  end

end

def sum_to_n? arr, n
  if arr.length == 0
    return false
  else
    arr.each_with_index { |value, index|
      @require_value = n - value
      arr.each_with_index { |to_compare_value, to_compare_index|
        if to_compare_value == @require_value && to_compare_index != index
          return true
        end
      }
    }
  end
  return false
end

# Part 2
def hello(name)
  return "Hello, " + name
end

def starts_with_consonant? s
  if s.empty?
    return false
  # check if it start with a special char
  elsif s[0] !~ /^[a-zA-Z0-9](.*[a-zA-Z0-9])?$/
    return false
  # check if it start with a consonant
  elsif s[0] !~ /[AEIOU]/i
    return true
  end
  
  return false
end

def binary_multiple_of_4? s
  # check if a string is empty
  if s.length == 0
    return false
  # check if a binary string
  elsif s !~ /^[0-1]*$/
    return false
  else 
    order = s.length - 1
    sum = 0
    counter = 0
    
    s.each_char { |value|
      if value == '1'
        exponent = order - counter
        if exponent == 0
          sum = sum + 1
        else
          sum = sum + 2 ** exponent
        end
      end
      counter += 1
    }
    
    if sum % 4 == 0
      return true
    else
      return false
    end
  end
end

# Part 3
class BookInStock
  @isbn = ''
  @price = 0
  def initialize(isbn, price)
    if isbn.length == 0
      raise ArgumentError, "Missing ISBN for book"
    end
    
    if price <= 0
      raise ArgumentError, "Invalid price"
      
    end
    @isbn = isbn
    @price = price
  end
  
  def price_as_string
    return "$%.2f" %@price
  end
  
  # getter setter for isbn
  attr_reader :isbn
  attr_writer :isbn
  
  # getter setter for price
  attr_reader :price
  attr_writer :price
  
    
end
