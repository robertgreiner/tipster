require 'tmpdir'

class File
  def self.root(file)
    expand_path('../../../', dirname(__FILE__)) << '/' << file
  end
  def self.temp(file)
    expand_path File.expand_path Dir.tmpdir << '/' << file
  end
end