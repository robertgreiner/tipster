require 'rspec'
require_relative '../../lib/tipster/files/file'

describe "File" do
  it "should get the path of a file from the root directory" do
    path = File.root "test.rb"
    path.include?('/tipster/test.rb').should be true
  end
  it "should not contain relative path" do
    path = File.root "test.rb"
    path.include?('..').should be false
  end
end
