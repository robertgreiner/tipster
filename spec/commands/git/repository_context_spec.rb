require 'rspec'
require_relative '../../../lib/tipster/commands/git/repository_context'

describe "a git repository" do

  before do
    LatestCommit.stub(:new).and_return double("LatestCommit")
    @latest_commit = LatestCommit.new
  end

  it "should not be in a valid repository" do
    @latest_commit.stub(:id).and_return ''
    RepositoryContext.valid_repository?.should be false
  end

  it "should be in a valid repository" do
    @latest_commit.stub(:id).and_return 'be6da5838f94e3003ea92150fae92fb5b07c04bb'
    RepositoryContext.valid_repository?.should be true
  end
end

describe "a git commit" do

  before do
    FilesChanged.stub(:new).and_return double("FilesChanged")
    @files_changed = FilesChanged.new(stub(:commit_id => ''))
  end

  it "should not be a valid git commit" do
    @files_changed.stub(:list).and_return ''
    RepositoryContext.valid_commit_id?('be6da5838f94e3003ea92150fae92fb5b07c04bb').should be false
  end

  it "should not be a valid git commit" do
    @files_changed.stub(:list).and_return 'some file information'
    RepositoryContext.valid_commit_id?('some-invalid-id').should be true
  end
end

