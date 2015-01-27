class Route
  attr_reader :nodes
  def initialize(sz)
    @sz = sz
    @nodes = []
    (sz * sz).times do |i|
      node = []
      node << (i - 1) unless (i % sz) == 0
      node << (i + 1) unless (i % sz) == (sz - 1)
      node << (i - sz) if i > sz
      node << (i + sz) if i < (sz * (sz - 1)) 
      @nodes << node
    end
  end

  def solve(xs)
    xs.split(' ').each do |x|
      i1, i2 = x.split('').map{|e| ('a'..'y').to_a.index(e)}
      @nodes[i1].delete(i2)
      @nodes[i2].delete(i1)
    end

    @done = {}
    @count = 0
    move(0)
    @count
  end

  def move(i)
    return if @done[i]
    if i == @sz * @sz - 1
      @count += 1
      return
    end
    @done[i] = true
    @nodes[i].each do |j|
      move(j)
    end
    @done[i] = false
  end
end

route = Route.new(5)
p route.nodes
p route.solve("")
