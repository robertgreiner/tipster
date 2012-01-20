require 'rubygems'
require 'launchy'
require_relative '../presenters/code_ratio_presenter'
require_relative '../presenters/code_churn_presenter'
require_relative '../files/file'

class HtmlReport

	def initialize(commit_id = nil)
    @risk_report = File.temp 'risk_report.html'
		generate html commit_id
	end

	def html(commit_id)
		code_ratio_presenter = CodeRatioPresenter.new commit_id
		code_ratio_status = code_ratio_presenter.status

    code_churn_presenter = CodeChurnPresenter.new commit_id
    code_churn_status = code_churn_presenter.status

		header << file_details(code_ratio_presenter.change_list) << code_ratio_details(code_ratio_status) << code_churn_details(code_churn_status) << footer
	end

  def generate(source)
		File.open(@risk_report, 'w') {|f| f.write(source) }
	end

	def display_in_browser
    puts @risk_report
		Launchy.open('file:///' << @risk_report)
	end

	def file_details(change_list)
		file_details = "
			<h2>What files am I checking in?</h2>
		  <div class=\"commitDetails\">
		  	<ul>"

		change_list.each { |x| file_details << "<li>" << x.file_name << "</li>" }

		file_details << "
		  	</ul>
		  </div>
		"
	end

	def code_ratio_details(code_ratio_status)
		"
			<h2>Is my code risky?</h2>
			<div class=\"heuristicStatus #{code_ratio_status.status}\">
				<ul>
					<li class=\"result\">#{code_ratio_status.status}</li>
			    <li class=\"heuristicName\">Code Ratio</li>
			    <li class=\"description\">#{code_ratio_status.description}</li>
			  </ul>
		  </div>
		"
	end

  def code_churn_details(code_churn_status)
    "
			<div class=\"heuristicStatus #{code_churn_status.status}\">
				<ul>
					<li class=\"result\">#{code_churn_status.status}</li>
			    <li class=\"heuristicName\">Code Churn</li>
			    <li class=\"description\">#{code_churn_status.description}</li>
			  </ul>
		  </div>
		"
  end

	def header
		"
		<!DOCTYPE html>
		<html lang=\"en\">
		  <head>
		    <meta charset=\"utf-8\" />
		    <title>Check-In Risk Report</title>

		    <style media=\"screen\" type=\"text/css\">
		    	body {
		    		font-family: Helvetica, \"Helvetica Neue\", Arial;
		    		font-size: 16px;
		    		color: #333;
		    	}

		    	h1 {
		    		font-size: 20px;
		    	}

		    	h2 {
		    		font-size: 16px;
		    	}

		    	.commitDetails {
		    		font-size: 12px;
		    	}

		    	.heuristicStatus ul, .heuristicStatus li {
						display: inline;
					}

					.heuristicStatus ul li {
						display: block;
						padding: 1px 5px 0px 5px;
						float: left;
					}

					.Risky {
		    		border-left: 5px solid #9e2b20;
		    		height: 20px;
		    		margin-bottom: 15px;
		    	}

		    	.Safe {
		    		border-left: 5px solid #0af510;
		    		height: 20px;
		    		margin-bottom: 15px;
		    	}

					.heuristicName {
						color: #555;
					}

					.result {
						font-weight: bold;
					}

					.description {
						color: #999;
					}
				</style>

		  </head>
		  <body>
		  <h1>Commit Risk Report</h1>
		 "
	end

	def footer
		"
		  </body>
		</html>"
	end
end