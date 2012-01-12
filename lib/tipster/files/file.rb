class File
  def self.here(file)
    expand_path(dirname(__FILE__)) << file
  end
  def self.root(file)
    expand_path('../../../', dirname(__FILE__)) << '/' << file
  end
end