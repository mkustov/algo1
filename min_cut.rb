@file = File.read('kargerMinCut.txt')
@array = @file.split("\n").map(&:to_i)
@graph = {}

def read_graph
  g = {}
  @file.each_line do |line|
    l = line.split.map(&:to_i)
    g[l[0]] = l[1..l.size-1]
  end
  g  
end

def karger(g)
  while g.size > 2 do
    u, v = random_edge(g)
    g[u].concat(g[v])
    g[v].each { |vertex| g[vertex].map!{ |i| i == v ? u : i } }
    g[u] -= [u]
    g.delete(v)
  end
  g.shift[1].size
end

def random_edge(g)
  v1 = g.keys.sample
  v2 = g[v1].sample
  [v1, v2]
end

def calculate
  size = []
  500.times do
    size << karger(read_graph)
  end
  size.min
end