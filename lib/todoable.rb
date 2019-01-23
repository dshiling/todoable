require "todoable/version"

module Todoable
  class Error < StandardError; end

  attr_writer :http

  private

  def http
    @http ||= Todoable::HTTP.new
  end

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
      @conn ||= begin
                  Faraday.new(url: host) do |conn|
                    conn.token_auth(token)
                    conn.request :json
                    conn.adapter Faraday.default_adapter
                  end
                rescue Faraday::UnauthorizedError
                  Faraday.new(url: host) do |conn|
                    conn.basic_auth(ENV['USERNAME'], ENV['PASSWORD'])
                    conn.request :json
                    conn.adapter Faraday.default_adapter
                  end
                end
    end
  end
end