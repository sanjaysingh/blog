module Jekyll
  module DateFilter
    def format_date(date)
      date.strftime("%Y-%m-%d")
    end
  end
end

Liquid::Template.register_filter(Jekyll::DateFilter) 