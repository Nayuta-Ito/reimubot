def expand(s, n)

  i = s.length - 1
  sk = i - 1
  while sk >= 0 do
    if s[sk][0] < s[i][0] && (s[sk][1] < s[i][1] || s[i][1] == 0)
      break
    end
    sk -= 1
  end

  ai = s[i][0]
  bi = s[i][1]
  ask = s[sk][0]
  bsk = s[sk][1]

  # 4.
  if ai == 0 && bi == 0
    return s[0...-1]
  end

  # 5.-7.
  if bi-bsk == 1
    # 5.
    if ai-ask == 1
      a = s[0...sk]
      b = s[sk...i]
      return a + b * n
    end
    
    # 6.
    if i - sk - 1 <= ai
      delta = ai - ask - 1
      result = s[0...sk]
      (n + 1).times do |j|
        bad = s[sk...i]
        c = bad.map{ |t| t[0] + delta * j }
        d = bad.map{ |t| t[1] }
        result += c.zip(d)
      end
      return result
    end
    
    # 7.
    delta1 = ai - ask - 1
    delta2 = i - sk - 1
    result = s[0...sk]
    (n + 1).times do |j|
      bad = s[sk...i]
      c = bad.map{ |t| t[0] + delta2 * j }
      d = bad.map{ |t| t[1] }
      c[0] = bad[0][0] + delta1 * j
      result += c.zip(d)
    end
    return result
  end
  
  # 8-9.
  if bi == 0
    # 8.
    if ai - ask == 1
      a = s[0...sk]
      b = s[sk...i]
      return a + b * n
    end
    
    # 9.
    delta = ai - ask - 1
    result = s[0...sk]
    (n + 1).times do |j|
      bad = s[sk...i]
      c = bad.map{ |t| t[0] + delta * j }
      d = bad.map{ |t| t[1] }
      result += c.zip(d)
    end
    return result
  end
  
end

p expand([[0,0],[1,1],[2,2],[2,1],[2,1]],3)


