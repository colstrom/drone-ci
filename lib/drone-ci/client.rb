# frozen_string_literal: true

require 'httpx/adapters/faraday'
require 'faraday'
require 'faraday/retry'

require_relative 'api'

module DroneCI
  class Client
    include API

    def initialize(**options)
      @api = options.fetch(:client) do
        server = options.fetch(:server) { ENV.fetch('DRONE_SERVER') }
        token  = options.fetch(:token)  { ENV.fetch('DRONE_TOKEN')  }
        Faraday.new(server) do |client|
          client.adapter :httpx
          client.headers = {
            'Authorization' => "Bearer #{token}"
          }.merge(options.fetch(:headers, {}))
          client.path_prefix = '/api'
          client.request :json
          client.request :retry
          client.response :json
          yield client if block_given?
        end
      end
    end

    attr_reader :api
  end
end
