class Integer
  def b; self.to_s(2); end
  def h; self.to_s(16); end
end

class String
  def b; self.to_i(2); end
  def h; self.to_i(16); end
end
