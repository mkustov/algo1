@file = File.read('QuickSort.txt')
class Array
  @@total_comparisons = 0

  def total_comparisons
    @@total_comparisons    
  end

  def median
    array = [self[0], self[(self.size - 1) / 2], self[self.size-1]]
    array.delete(array.max)
    array.delete(array.min)
    self.index array.first
  end

  def swap!(i, j)
    temp = self[i]
    self[i] = self[j]
    self[j] = temp
  end

  def quick_sort!(l = 0, r = self.size - 1)
    if l < r
      comparisons = r - l
      pivot = median
      comparisons += quick_sort!(l, pivot - 1).to_i
      comparisons += quick_sort!(pivot+1, r).to_i
      comparisons
    end
  end

  def partition(l, r)
    pivot = self[l]
    i = l + 1
    j = l + 1

    for j in j..r do
      if self[j] < pivot
        self.swap!(j, i)
        i += 1
      end
    end
    self.swap!(l, i - 1)
    i-1 # firs element as pivot
  end
end

@array = @file.split("\n").map(&:to_i)
