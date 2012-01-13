require_relative 'tipster/reports/html_report'

class Tipster
  def initialize(repository_path = '.')
    Dir.chdir repository_path
  end
  def html_report(commit_id = 'HEAD')
    HtmlReport.new(commit_id).display_in_browser
  end
end