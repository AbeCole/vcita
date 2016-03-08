module Vcita
  @@api_token
  API_URL = 'https://api2.vcita.com/v2/'
  API_HOOK_URL = 'https://hook.vcita.com/v1/'

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

  def self.subscribe(entity, event, callback_url)
    data = {
      event: "#{entity}/#{event}",
      target_url: callback_url
    }

    self.send_subscribe(data)
  end

  def self.unsubscribe(callback_url)
    data = {
      target_url: callback_url
    }

    self.send_subscribe(data, 'unsubscribe')
  end

  private
    def self.send_request(endpoint, data = nil)
      require 'net/http'
      require 'json'

      uri = URI("#{API_URL}#{endpoint}")
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

    def self.send_subscribe(data, type = 'subscribe')
      require 'net/http'
      require 'json'

      uri = URI("#{Vcita::API_HOOK_URL}subscriptions/standard/#{type}")
      request = Net::HTTP::Post.new(uri)
      request["Authorization"] = "Token #{@@api_token}"
      request["Content-Type"] = "application/json"
      request.body = data.to_json

      res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => true) do |http|
        http.request(request)
      end

      response = JSON.parse(res.body)
      response[:uri] = uri
      response[:data] = data.to_json
      response
    end
end
