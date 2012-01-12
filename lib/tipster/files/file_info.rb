class FileInfo
  def initialize(file_name)
    @file_name = file_name
  end

  def line_count
    File.readlines(@file_name).length
  end
end