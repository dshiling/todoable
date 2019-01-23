require "test_helper"

class TodoableTest < Minitest::Test

	def get_all_lists_returns_200
		stubs = Faraday::Adapter::Test::Stubs.new do |stub|
	  		stub.get('/lists') { |env| [200, {}, 'test'] }
		end

		assert_not_empty stubs
	end
end
