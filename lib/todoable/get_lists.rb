module Todoable
  class GetLists
    def perform(token)
      http.get '/lists'
    end
  end
end