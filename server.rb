require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative 'models/my_class.rb'
require 'csv'

set :bind, '0.0.0.0'  # bind to all interfaces


def array_of_article_object
  articles = []
  CSV.foreach("article.csv", headers: true) do |each_article|
    articles << Pets.new(each_article["description"], each_article["title"], each_article["url"])
    # binding.pry
  end
  # binding.pry
  articles
end


get "/" do
  redirect to "/article"
end

get "/article" do
  @news = array_of_article_object
  erb :index
end

get "/article/new" do
  # @news = array_of_article_object
  erb :new
end

post "/article/new" do
  CSV.open("article.csv", "a") do |file|
    file << [params[:description], params[:title], params[:url]]
  end
    redirect to "/"
end

get "/article/new/random" do
  article = CSV.read("article.csv")
  random_article = article.sampleh
  content_type :json
  status 200
  random_article.to_json
end
