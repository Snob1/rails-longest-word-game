require 'game'
class GamesController < ApplicationController

  def game
    @start_time = Time.now
    @grid = generate_grid(9)
    @grid = @grid.join(" ")
    if session[:try] == nil
      session[:try] = 1
    else
      session[:try] += 1
    end
    @try = session[:try]
  end

  def score
    @attempt = params[:words]
    @start_time = params[:start_time].to_i
    @end_time = Time.now
    @try = params[:try].to_i
    @result = run_game(@attempt, params[:grid].split(" "), @start_time, @end_time)
  end
end
