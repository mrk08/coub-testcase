class WeekDate < Struct.new(:month, :date)
  def day
    date.day
  end

  def current_month?
    date.month == month
  end

  def today?
    date == Date.today
  end
end