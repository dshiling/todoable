require 'faraday'
require 'faraday_middleware'

module Todoable
  class HTTP
    def get(path, query)
      connection.get path, query
    end

    def post(path, payload)
      connection.post path do |request|
        request.body = payload
      end
    end

    def delete(path, payload)
      connection.delete path do |request|
        request.body = payload
      end
    end

    def patch(path, payload)
      connection.patch path do |request|
        request.body = payload
      end
    end

    def put(path, payload)
      connection.put path do |request|
        request.body = payload
      end
    end

    def connection
      # tokens expire every 20 mins, first try token auth, re-do basic auth if stale
      @conn ||= if request[:expires_at] < Time.zone.now
                  Faraday.new(url: host) do |conn|
                    conn.token_auth(request[:token])
                    conn.request :json
                    conn.adapter Faraday.default_adapter
                  end
                else
                  authenticate
                end
    end

    attr_accessor :request

    def authenticate
       @request ||= Faraday.new(url: host + '/authorize') do |conn|
                      conn.basic_auth(ENV['USERNAME'], ENV['PASSWORD'])
                      conn.request :json
                      conn.adapter Faraday.default_adapter
                    end
    end
  end

  attr_writer :http

  private

  def http
    @http ||= Todoable::HTTP.new
  end

  def host
    @host ||= ENV['BASE_URL']
  end
end