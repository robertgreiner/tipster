require_relative 'tipster/reports/html_report'

class Tipster
  def initialize(repository_root_path = '.')
    Dir.chdir repository_root_path
  end
  def html_report(commit_id = 'HEAD', count = 1)
    for i in 0..count - 1
      next_commit_id = commit_id << "~#{i}"
      in_root? ? HtmlReport.new(next_commit_id).display_in_browser : display_error
    end
  end

  def in_root?
    File.directory? '.git'
  end

  def display_error
    puts "Error: Please provide the path to the root of the git repository."
  end
end