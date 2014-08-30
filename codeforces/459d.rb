MAXN = 1e6.round + 100

class BIT
  def initialize
    @tree = Array.new(MAXN).fill(0)
  end

  def at(i)
    i += 1
    _sum(i) - _sum(i - 1)
  end

  def sum(i, j)
    i += 1
    j += 1
    _sum(j) - _sum(i - 1)
  end

  def change(i, delta)
    i += 1
    now = i
    while now < MAXN
      @tree[now] += delta
      now += low_bit(now)
    end
  end

private
  def low_bit(x)
    x & (-x)
  end

  def _sum(i)
    now = i
    result = 0
    while now > 0
      result += @tree[now]
      now -= low_bit(now)
    end
    result
  end
end

class Solution
  def initialize(n, a)
    @n = n
    @a = a
    pre
  end

  def pre
    mapping = Hash.new
    @maxidx = 0
    @a.uniq.sort.each_with_index do |num, idx|
      mapping[num] = idx
      @maxidx = idx
    end
    @a.map! do |num|
      mapping[num]
    end
  end

  def solve
    binary_indexed_tree = BIT.new
    binary_indexed_tree.change(0, @maxidx + 1)
    cnt = Array.new(@n + 1).fill(0)

    ans = 0
    (0).upto(@n - 2) do |i|
      cur_num = @a[i]
      cnt[cur_num] += 1
      cnt_reverse[cur_num] -= 1
      binary_indexed_tree.change(cnt_reverse[cur_num], 1)
      binary_indexed_tree.change(cnt_reverse[cur_num] + 1, -1)
      ans += binary_indexed_tree.sum(1, cnt[cur_num] - 1)
    end
    ans
  end
end

# n = gets.chomp.to_i
# a = gets.chomp.split.map! {|n| n.to_i}

# puts Solution.new(n, a).solve
puts Solution.new(7, [1, 2, 1, 1, 2, 2, 1]).solve
# puts Solution.new(3, [1, 1, 1]).solve
# puts Solution.new(5, [1, 2, 3, 4, 5]).solve