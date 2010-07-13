class HistoryPoint < ActiveRecord::Base
  
  def time_at_string  
    time.getlocal.to_s(:db)  
  end  
  
  def time_at_string=(time_at_str)  
    self.time = Time.parse(time_at_str)  
  end 
  
  #http://localhost:3000/history_points?start=2009-07-03+18:42:00&end=2011-07-03+18:42:00&east=2&west=1&north=2&south=1&commit=Search
  def self.find_history_points(params)
    history_points = scoped  
    if params[:start] && params[:end] && params[:east] && params[:west] && params[:north] && params[:south]
      history_points = history_points.all(:conditions => "time between '#{params[:start]}' and '#{params[:end]}' and latitude between #{params[:west]} and #{params[:east]} and longitude between #{params[:south]} and #{params[:north]}") 
    end
    history_points
  end
end
