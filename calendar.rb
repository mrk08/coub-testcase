require 'date'
require './calendar/week'
require './calendar/week_date'

class Calendar
  def initialize(year, month)
    @year, @month = year.to_i, month.to_i
    raise ArgumentError.new('invalid month') unless (1..12).include?(@month)
  end

  def day_names
    names = Date::ABBR_DAYNAMES.dup
    names.push(names.shift)
  end

  def weeks
    if first_week_of_month < last_week_of_month
      (first_week_of_month..last_week_of_month).to_a
    else
      (first_week_of_month..52).to_a + (1..last_week_of_month).to_a # sometimes weeks sequence breaks
    end
  end

  def each_weeks(&block)
    weeks.each { |week| block.call(Week.new(@year, @month, week)) }
  end

  def prev_month_date
    first_date_of_month << 1
  end

  def next_month_date
    last_date_of_month >> 1
  end

  private

    def first_date_of_month
      Date.civil(@year, @month, 1)
    end

    def last_date_of_month
      Date.civil(@year, @month, -1)
    end

    def first_week_of_month
      first_date_of_month.cweek
    end

    def last_week_of_month
      last_date_of_month.cweek
    end
end