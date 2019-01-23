module Todoable
  class GetLists
    def perform
      http.get '/lists'
    end
  end
end