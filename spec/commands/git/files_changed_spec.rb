require 'rspec'
require_relative '../../../lib/tipster/commands/git/files_changed'

describe "git show --numstat" do
  it "should return detailed information about a specified commit" do
    files_changed = FilesChanged.new("d229f066bec91f6fc80448f707e7b070c1791631").list
    files_changed.include?("Robert").should be true
  end
end
