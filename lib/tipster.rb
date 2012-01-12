require_relative 'tipster/reports/html_report'

class Tipster
  def initialize(repository_path = '.')
    Dir.chdir repository_path
  end
  def html_report
    HtmlReport.new.display_in_browser
  end
end