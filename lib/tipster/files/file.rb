class File
  def self.root(file)
    expand_path('../../../', dirname(__FILE__)) << '/' << file
  end
end