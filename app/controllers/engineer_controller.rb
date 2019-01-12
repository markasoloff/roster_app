class EngineerController < ApplicationController
  def index
    response = HTTP.get("https://api.myjson.com/bins/16roa3")
      
        data = response
        data_parsed = JSON.parse(data)
        puts data_parsed
        @eng = data_parsed      
        # @eng = data_parsed.dig(0,"name")
         
    
      render 'index.html.erb'
  end
end

# "image", "title", "bio", "vote"
