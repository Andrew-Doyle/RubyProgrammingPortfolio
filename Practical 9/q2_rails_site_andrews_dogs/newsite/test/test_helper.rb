def seq(n, ar)
    while ar.length < 4 do
        ar << n
        n - ((n *2) - 3)
      seq(n, ar)
    end
  return n, ar
end


#p  seq(5, [])

n = 3

p n << 3
