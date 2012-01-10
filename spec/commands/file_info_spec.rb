require 'helper'
require 'commands/file_info'

describe "Line count" do
  it "should return the number of lines in a file" do
    file_name = "../spec/stub/fake_file.txt"
    FileInfo.new(file_name).line_count.should be 10
  end
  it "should raise an error if the file does not exist" do
    file_name = "../spec/stub/does-not-exist.txt"
    expect { FileInfo.new(file_name).line_count }.to raise_error(Errno::ENOENT)
  end
end