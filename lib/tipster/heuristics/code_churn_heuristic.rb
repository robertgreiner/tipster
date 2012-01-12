require_relative '../history/commit_history'
require_relative '../commands/file_info'
require_relative '../files/file'

class CodeChurnHeuristic

  attr_reader :files

  def initialize
    @files = Hash.new
    @passing_ratio = 0.5
  end

  def apply(changed_files)
    changed_files.each { |file| process(file) }
  end

  def process(file)
    @files[file.file_name] = churn_ratio file
  end

  def churn_ratio(file)

    total_lines = FileInfo.new(File.root file.file_name).line_count
    churned_lines = file.lines_modified
    churned_lines.to_f / total_lines.to_f
  end

  def pass?
    @files.each do |key, value|
      if value > @passing_ratio
        return false
      end
    end
    true
  end
end