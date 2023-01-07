require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ('A'..'Z').to_a.sample }
    @letters
  end

  def score
    @answer = params[:word]
    grid = params[:letters].split(' ')
    @word_in_dict = JSON.parse(URI.open("https://wagon-dictionary.herokuapp.com/#{@answer}").read)["found"]
    @in_grid = @answer.upcase.chars.all? { |char| @answer.upcase.count(char) <= grid.count(char)}
  end
end
