class CommitHistory
  attr_accessor :lines_modified, :lines_removed, :file_name

  def initialize(lines_modified = 0, lines_removed = 0, file_name = "")
    @lines_modified = lines_modified
    @lines_removed = lines_removed
    @file_name = file_name
  end
end