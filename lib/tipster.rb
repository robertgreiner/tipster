require_relative 'tipster/reports/html_report'

class Tipster
  def html_report
    HtmlReport.new.display_in_browser
  end
end