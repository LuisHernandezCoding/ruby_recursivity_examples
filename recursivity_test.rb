# frozen_string_literal: true

# this will be an example of recursivity in ruby
p 'We will test the recursivity in ruby'
p 'true means that recursivity is working faster than no recursivity'
p 'false means that recursivity is working slower than no recursivity'
# define the function for recursivity
def rock_judger(r_arr)
  count = r_arr.length
  a, b =  count <= 2 ? [r_arr[0], r_arr[-1]] : [rock_judger(r_arr.pop(count / 2)), rock_judger(r_arr)]
  a > b ? a : b
end

# first example

# make some random rocks
rocks = 50_000.times.map { rand(1..200) }
max_rock = 0

# check the time before the loop
time = Time.now
rocks.each do |rock|
  max_rock = rock if max_rock < rock
end
# check the time after the loop
comparition = Time.now - time

# check the time before the recursivity
old_comparsion = comparition
time = Time.now
rock_judger(rocks)
comparison = Time.now - time

# check the time difference and print it the fastest way
puts 'Test 1: '
puts "true by #{old_comparsion / comparison} seconds" if old_comparsion > comparison
puts "false by #{old_comparsion / comparison} seconds" if old_comparsion < comparison

# Define a recursive function that finds the factorial of a number.
def factorial_req(num)
  if num.zero?
    1
  else
    num * factorial_req(num - 1)
  end
end

# Define a no recursive function that finds the factorial of a number.
def factorial(num)
  result = 1
  while num.positive?
    result *= num
    num -= 1
  end
  result
end

number = 8000
time = Time.now
factorial_req(number)
time_req = (Time.now - time) * 1000
time = Time.now
factorial(number)
time_no_req = (Time.now - time) * 1000

puts 'Test 2: '
puts "true by #{time_no_req / time_req} seconds" if time_no_req > time_req
puts "false by #{time_no_req / time_req} seconds" if time_no_req < time_req

# Define a recursive function that returns true if a string is a palindrome and false otherwise.
def palindrome(string)
  if string.length == 1 || string.length.zero?
    true
  elsif string[0] == string[-1]
    palindrome(string[1..-2])
  else
    false
  end
end

# Define a no recursive function that returns true if a string is a palindrome and false otherwise.
def palindrome_no_req(string)
  string == string.reverse
end

string = 'racecar'
time = Time.now
palindrome(string)
time_req = (Time.now - time) * 1000
time = Time.now
palindrome_no_req(string)
time_no_req = (Time.now - time) * 1000

puts 'Test 3: '
puts "true by #{time_no_req / time_req} seconds" if time_no_req > time_req
puts "false by #{time_no_req / time_req} seconds" if time_no_req < time_req
# Define a recursive function that flattens an array.
# The method should convert [[1, 2], [3, 4]] to [1, 2, 3, 4] and [[1, [8, 9]], [3, 4]] to [1, 8, 9, 3, 4].
def flatten(array)
  result = []
  array.each do |item|
    if item.is_a?(Array)
      result += flatten(item)
    else
      result << item
    end
  end
  result
end

# Define a no recursive function that flattens an array.
# The method should convert [[1, 2], [3, 4]] to [1, 2, 3, 4] and [[1, [8, 9]], [3, 4]] to [1, 8, 9, 3, 4].
def flatten_no_req(array)
  result = []
  array.each do |item|
    if item.is_a?(Array)
      item.each { |item2| result << item2 }
    else
      result << item
    end
  end
  result
end

array = [1, 2, [3, 4, [5, 6, [7, 8, [9, 10]]]]]
time = Time.now
flatten(array)
time_req = (Time.now - time) * 1000
time = Time.now
flatten_no_req(array)
time_no_req = (Time.now - time) * 1000

puts 'Test 4: '
puts "true by #{time_no_req / time_req} seconds" if time_no_req > time_req
puts "false by #{time_no_req / time_req} seconds" if time_no_req < time_req

# Define a recursive function that merges two sorted arrays into a new sorted array.
def merge(array1, array2)
  if array1.length.zero?
    array2
  elsif array2.length.zero?
    array1
  elsif array1[0] < array2[0]
    [array1[0]] + merge(array1[1..], array2)
  else
    [array2[0]] + merge(array1, array2[1..])
  end
end

# Define a no recursive function that merges two sorted arrays into a new sorted array.
def merge_no_req(array1, array2)
  array1.concat(array2).sort
end

array1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
array2 = [11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
time = Time.now
merge(array1, array2)
time_req = (Time.now - time) * 1000
time = Time.now
merge_no_req(array1, array2)
time_no_req = (Time.now - time) * 1000

puts 'Test 5: '
puts "true by #{time_no_req / time_req} seconds" if time_no_req > time_req
puts "false by #{time_no_req / time_req} seconds" if time_no_req < time_req

# Define a recursive function that accepts a base and an exponent,
# and returns the base raise to the power of the exponent. For example, pow(2, 3) is 8.
def pow_req(base, exponent)
  if exponent.zero?
    1
  else
    base * pow_req(base, exponent - 1)
  end
end

# Define a no recursive function that accepts a base and an exponent,
# and returns the base raise to the power of the exponent. For example, pow(2, 3) is 8.
def pow(base, exponent)
  result = 1
  exponent.times do
    result *= base
  end
  result
end

base = 2
exponent = 500
time = Time.now
pow_req(base, exponent)
time_req = (Time.now - time) * 1000
time = Time.now
pow(base, exponent)
time_no_req = (Time.now - time) * 1000

puts 'Test 6: '
puts "true by #{time_no_req / time_req} seconds" if time_no_req > time_req
puts "false by #{time_no_req / time_req} seconds" if time_no_req < time_req

# Define a recursive function that accepts an array of strings
# and returns a new array containing each string reversed.
def reverse_words_req(array)
  if array.length.zero?
    []
  else
    [array[0].reverse] + reverse_words_req(array[1..])
  end
end

# Define a no recursive function that accepts an array of strings
# and returns a new array containing each string reversed.
def reverse_words(array)
  array.map(&:reverse)
end

array = %w[a b c d e f g h i j]
time = Time.now
reverse_words_req(array)
time_req = (Time.now - time) * 1000
time = Time.now
reverse_words(array)
time_no_req = (Time.now - time) * 1000

puts 'Test 7: '
puts "true by #{time_no_req / time_req} seconds" if time_no_req > time_req
puts "false by #{time_no_req / time_req} seconds" if time_no_req < time_req

# Define a recursive function that accepts a number and
# returns the sum of all numbers from 1 up to and including that number.
def sum_to_req(number)
  if number == 1
    1
  else
    number + sum_to_req(number - 1)
  end
end

# Define a no recursive function that accepts a number and
# returns the sum of all numbers from 1 up to and including that number.
def sum_to(number)
  result = 0
  while number.positive?
    result += number
    number -= 1
  end
  result
end

number = 5000
time = Time.now
sum_to_req(number)
time_req = (Time.now - time) * 1000
time = Time.now
sum_to(number)
time_no_req = (Time.now - time) * 1000

puts 'Test 8: '
puts "true by #{time_no_req / time_req} seconds" if time_no_req > time_req
puts "false by #{time_no_req / time_req} seconds" if time_no_req < time_req

# Define a recursive function with fibonaci sequence that accepts a
# number and returns an array containing that many numbers from the fibonacci sequence
def fibs_req(number)
  case number
  when 1
    [0]
  when 2
    [0, 1]
  else
    array = fibs_req(number - 1)
    array << array[-1] + array[-2]
  end
end

# Define a no recursive function with fibonaci sequence that accepts a
# number and returns an array containing that many numbers from the fibonacci sequence
def fibs(number)
  array = [0, 1]
  array << array[-1] + array[-2] while array.length < number
  array
end

number = 50
time = Time.now
fibs_req(number)
time_req = (Time.now - time) * 1000
time = Time.now
fibs(number)
time_no_req = (Time.now - time) * 1000

puts 'Test 9: '
puts "true by #{time_no_req / time_req} seconds" if time_no_req > time_req
puts "false by #{time_no_req / time_req} seconds" if time_no_req < time_req

# define a recursive function that uses merge sort to sort an array like bubble sort
# rubocop:disable Metrics/AbcSize
def bubble_sort_req(array)
  if array.length == 1
    array
  else
    array.each_with_index do |_item, index|
      if array[index + 1] && array[index] > array[index + 1]
        array[index], array[index + 1] = array[index + 1], array[index]
      end
    end
    bubble_sort_req(array[0..-2]) << array[-1]
  end
end
# rubocop:enable Metrics/AbcSize

# define a no recursive function that uses merge sort to sort an array like bubble sort
def bubble_sort(array)
  array.sort
end

array = [1..50].to_a.shuffle
time = Time.now
bubble_sort_req(array)
time_req = (Time.now - time) * 1000
time = Time.now
bubble_sort(array)
time_no_req = (Time.now - time) * 1000

puts 'Test 10: '
puts "true by #{time_no_req / time_req} seconds" if time_no_req > time_req
puts "false by #{time_no_req / time_req} seconds" if time_no_req < time_req
