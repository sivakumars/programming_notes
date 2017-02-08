require "sinatra"
require "sinatra/reloader" if development?
require "tilt/erubis" 

helpers do
  def in_paragraphs(text)
    text.split("\n\n").map.with_index do |paragraph, index|
      "<p id=paragraph#{index}>" + paragraph + "</p>"
    end.join
  end

  def highlight(text, term)
    text.gsub(term, "<strong>#{term}</strong>")
  end
end

before do
  @contents = File.readlines("data/toc.txt")
end

get "/" do
  @title = "The Adventures of Sherlock Holmes"

  erb :home
end

get "/chapters/:number" do
  number = params[:number].to_i
  chapter_name = @contents[number - 1]
  @title = "Chapter #{number}: #{chapter_name}"
  @chapter = File.read("data/chp#{number}.txt")

  erb :chapter
end

get "/search" do
  query = params[:query]
  @results = []

  @contents.each_with_index do |name, index|
    number = index + 1
    chapter = File.read("data/chp#{number}.txt")
    matches = []
    chapter.split("\n\n").each_with_index do |paragraph, index|
      matches << {number: index, content: paragraph} if paragraph.match(/#{query}/i)
    end
    @results << { number: number, name: name, paragraphs: matches } if matches.any?
  end

  erb :search
end

not_found do
  redirect "/"
end
