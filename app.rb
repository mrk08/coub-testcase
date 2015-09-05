require 'sinatra'
require './calendar'

get '/' do
  @current = Date.today
  redirect "/#{@current.year}/#{@current.month}"
end

get '/:year/:month' do
  @current = Date.today
  begin
    @calendar = Calendar.new(params[:year], params[:month])
  rescue ArgumentError
    redirect "/#{@current.year}/#{@current.month}"
  end

  slim :calendar
end