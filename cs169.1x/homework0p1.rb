def sum(arr)
  return 0 if arr.length == 0
  arr.reduce(:+) 
end

def max_2_sum(arr)
  return 0 if arr.length == 0
  return arr[0] if arr.length == 1
  sorted = arr.sort { |a, b| b <=> a }
  sorted[0] + sorted[1]
end

def sum_to_n?(arr, n)
  return true if arr.length == n and n == 0
  for i in 1..arr.length-1
    return true if arr[0, i].include? n-arr[i]
  end
  return false
end