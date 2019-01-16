class EngineerController < ApplicationController
  require 'engineer.rb'
  def index
    response = HTTP.get("https://api.myjson.com/bins/16roa3")
      
        data = response
        @data_parsed = JSON.parse(data)
          i = 0
          @engineers = Engineer.all
          
          @data_parsed.length.times do
            if Engineer.where(:name => @data_parsed[i]["name"]).exists?   
              puts "No need to update"
              i = i + 1
            else
              puts "A new engineer record has been created"
              @engineer = Engineer.new(
              name: @data_parsed[i]["name"],
              image_url: @data_parsed[i]["image_url"],
              title: @data_parsed[i]["title"],
              bio: @data_parsed[i]["bio"],
              vote: @data_parsed[i]["vote"]
              )
              @engineer.save
              i = i + 1
            end
          end
      render 'index.html.erb'
  end

  def by_name
    engineer = Engineer.find_or_create_by(name: params[:name])
    
    unless engineer.name
        response = HTTP.get("https://api.myjson.com/bins/16roa3")

        response_parsed = JSON.parse(response)
        engineer.update(name: response_parsed["name"])
    end
    render json: {id: engineer.id}
  end


end
