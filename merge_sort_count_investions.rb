@file = File.read('merge_sort.txt')
@array = @file.split("\n").map(&:to_i)

def merge_sort(array)
  @split ||= 0
  array_size = array.size
  return array if array_size == 1
  left = merge_sort(array[0..array_size / 2 - 1])
  right = merge_sort(array[array_size / 2.. array_size])

  merge(left, right, array_size)
end

def merge(left, right, size)
  result = []
  k = 0

  while k < size-1 do
    while left.any? && right.any?
      already_copied = false
      if left[0] < right[0]
        result << left.delete_at(0)
      else
        @split += left.size unless already_copied
        already_copied = true
        result << right.delete_at(0)
      end
    end
    k += 1
  end

  while left.any?
    result << left.delete_at(0)
  end

  while right.any?
    result << right.delete_at(0)
  end

  result
end

merge_sort @array
puts @split
