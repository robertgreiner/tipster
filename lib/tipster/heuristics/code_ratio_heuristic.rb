require_relative '../history/commit_history'

class CodeRatioHeuristic

  attr_reader :test_lines_of_code, :production_lines_of_code

  def initialize
    @passing_ratio = 0.0
    @test_lines_of_code = 0
    @production_lines_of_code = 0
  end

  def apply(changed_files)
    changed_files.each { |file| process(file) }
  end

  def process(file)

    if file.file_name =~ /(spec|test)/i
      @test_lines_of_code += file.lines_modified
    elsif file.file_name =~ /(cs|rb|java)$/
      @production_lines_of_code += file.lines_modified
    end

  end

  def ratio
    @test_lines_of_code.to_f / @production_lines_of_code.to_f
  end

  def has_production_code?
    @production_lines_of_code > 0
  end

  def pass?
    has_production_code? ? ratio > @passing_ratio : true
  end

end