require 'helper'
require 'commands/git/latest_commit'

describe "The latest git commit" do
  it "should return the most recent hash" do
    result = LatestCommit.new.id
    true.should == true
    result.empty?.should == false
  end
end
