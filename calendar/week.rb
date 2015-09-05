class Week < Struct.new(:year, :month, :week)
  def dates
    (first_date..last_date).to_a
  end

  def each_dates(&block)
    dates.each { |date| block.call(WeekDate.new(month, date)) }
  end

  private

    def first_date
      Date.commercial(year, week, 1)
    end

    def last_date
      Date.commercial(year, week, -1)
    end
end