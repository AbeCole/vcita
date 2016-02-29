module Vcita
  @@api_token

  def self.new(api_token)
    @@api_token = api_token
    self
  end

  def self.profile
    self.make_request('profile')
  end

  def self.clients
    self.make_request('clients')
  end

  def self.appointments
    self.make_request('appointments')
  end

  def self.payments
    self.make_request('payments')
  end

  private
    def self.make_request(endpoint)
      require 'net/http'
      require 'json'

      uri = URI("https://api2.vcita.com/v2/#{endpoint}")

      res = Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
        request = Net::HTTP::Get.new uri
        request["Authorization"] = "Token #{@@api_token}"
        http.request(request)
      end

      JSON.parse(res.body)
    end
end
