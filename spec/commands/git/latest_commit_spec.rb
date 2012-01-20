require_relative '../../../lib/tipster/commands/git/latest_commit'

describe "The latest git commit" do
  it "should return the most recent SHA" do
    latest_commit = double("LatestCommit")
    latest_commit.stub(:id).and_return fake_sha
    sha = latest_commit.id
    sha.length.should be 40
  end
end

describe "An invalid git repository" do
  it "should have an empty id" do
    latest_commit = double("LatestCommit")
    latest_commit.stub(:id).and_return ''
    sha = latest_commit.id
    sha.length.should be 0
  end
end

def fake_sha
  'c5b5861cb13fc2f2fcbe0d3578758def652c08ab'
end