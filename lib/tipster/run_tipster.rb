require_relative '../tipster'

path = File.expand_path '../../'

Tipster.new(path).html_report("HEAD",3)



