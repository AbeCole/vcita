module Vcita
  def self.new(token)
    @token = token
    self
  end

  def token
    @token
  end
end
