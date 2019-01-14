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
              i = i+ 1
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
              i = i+ 1
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


# class Api::ArticlesController < ApplicationController
     
#   def show
#     @article = Article.find(params[:id])
#     if params["version"] == "swap"
#       render "swap.json.jbuilder"
#     elsif params["version"] == "add"
#       render "add.json.jbuilder"
#     elsif params["version"] == "redact"
#       render "redact.json.jbuilder"
#     else
#       render "show.json.jbuilder"
#     end
#   end

#   def create
#     @article = Article.new(
#                           headline: params[:headline],
#                           body: params[:body]
#                           )
#     @article.save
#     render 'show.json.jbuilder'
#   end

#   def update
#     @article = Article.find(params[:id])
    
#     @article.headline = params[:headline] || @article.headline
#     @article.body = params[:body] || @article.body

#       if @article.save
#         render 'show.json.jbuilder'
#       else
#         render json: {errors: @article.errors.full_messages }, status: :unprocessable_entity
#       end

#   end

#   def destroy
#     @article = Article.find(params[:id])
#     @article.destroy
#     render json: {status: "Article was removed."}
#   end

#   def by_api_ref
#     article = Article.find_or_create_by(api_ref: params[:api_ref])
    
#     unless article.body
#         response = HTTP.get("#{article.api_ref}?show-fields=body&api-key=#{ENV['API_KEY']}")
#         content = response.parse["response"]["content"]
#         article.update(body: response.parse["response"]["content"]["fields"]["body"], 
#         headline:response.parse["response"]["content"]["webTitle"])
#     end
#     render json: {id: article.id}
#   end

# end

