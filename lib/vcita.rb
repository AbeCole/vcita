module Vcita
  @@api_token

  def self.new(api_token)
    @@api_token = api_token
    self
  end

  def self.profile
    self.send_request('profile')
  end

  def self.clients
    self.send_request('clients')
  end

  def self.appointments
    self.send_request('appointments')
  end

  def self.create_appointment(details)
    self.send_request('appointments', details)
  end

  def self.payments
    self.send_request('payments')
  end

  private    
    def self.send_request(endpoint, data = nil)
      require 'net/http'
      require 'json'

      uri = URI("https://api2.vcita.com/v2/#{endpoint}")
      unless data.nil?
        request = Net::HTTP::Post.new(uri)
        request.set_form_data(data)
      else
        request = Net::HTTP::Get.new(uri)
      end
      request["Authorization"] = "Token #{@@api_token}"

      res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => true) do |http|
        http.request(request)
      end

      JSON.parse(res.body)
    end
end
