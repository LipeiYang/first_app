class HistoryPoint < ActiveRecord::Base
  
  def time_at_string  
    time.getlocal.to_s(:db)  
  end  
  
  def time_at_string=(time_at_str)  
    self.time = Time.parse(time_at_str)  
  end 
  
  def find_history_points(period, region)
    HistoryPoint.all(:conditions=> [ 
      "time between :start and :end 
      and latitude between :east and :west
      and longitude between :north and :south", 
      { :start => period[:start], :end => period[:end],
        :east => region[:east], :west => region[:west],
        :north => region[:north], :south => region[:south] } ])
  end
end
