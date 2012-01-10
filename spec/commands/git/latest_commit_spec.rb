require 'helper'
require 'commands/git/latest_commit'

describe "The latest git commit" do
  it "should return the most recent SHA" do
    sha = LatestCommit.new.id
    sha.length.should be 40
  end
end
