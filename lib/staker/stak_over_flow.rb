require 'open-uri'
require 'nokogiri'
require 'launchy'

module Staker

	class StakOverFlow

	  BASE_URL = "http://stackoverflow.com"
		SEARCH_URL = "#{BASE_URL}/search?q="
		SEARCH_LIMIT = 2
		def initialize
		end

		def query(q)
			query_url = SEARCH_URL + q.split.join('+')
			begin
				page = Nokogiri::HTML(open(query_url))
				@results = page.css('.result-link a')
			rescue => e
				puts "*" * 20
				puts e.message
				puts "*" * 20
				return false
			end

			get_links

			result = get_ansewers.to_s

			HtmlResponse.new(result)
		end

		def get_links
			@result_links = []
			@results.each do |link|
				@result_links << BASE_URL + link.attributes['href'].value
			end
		end

		def get_ansewers
			begin
				answers = []
				@result_links[0..SEARCH_LIMIT-1].each do |r_links|
					doc = Nokogiri::HTML(open(r_links))
					ans = doc.css('div.accepted-answer td.answercell div.post-text').to_s
					qstn = doc.css('#question-header .question-hyperlink')[0]
					qstn.attributes['href'].value = BASE_URL + qstn.attributes['href'].value
					unless ans.empty?
						answers << qstn.to_s + ans
					end
				end
				final_answers = answers.join('<hr>')
			rescue => e
				puts "*" * 20
				puts e.message
				puts "*" * 20
				return false
			end
		end
	end

	class HtmlResponse
		GEM_TITLE = "Stalker"
		TEMPLATE_ONE = "<html><head><title>Stalker</title>
		<style>
		pre {
		  overflow: auto;
		  font-size: 13px;
		  padding: 5px;
		  width: 800px;
		  width: 650px !ie7;
		  padding-bottom: 20px !ie7;
		  max-height: 600px;
		  background-color: #eee;
		  margin-bottom: 1em;
		  font-family: Consolas,Menlo,Monaco,Lucida Console,Liberation Mono,DejaVu Sans Mono,Bitstream Vera Sans Mono,Courier New,monospace,sans-serif;
		}
		p, pre {
			width: 800px;
			font-size: 18px;
		}
		</style>
		</head><body><h1>#{GEM_TITLE}</h1><h3>Result On : #{}</h3>"

		TEMPLATE_TWO = "</body></html>"

		def initialize(response)
			html_body = TEMPLATE_ONE + response + TEMPLATE_TWO
			# TODO:: Create file inside tmp
			out_file = File.new("staker_out.html", "w")
			out_file.puts(html_body)
			out_file.close
			Launchy.open(Dir.pwd + "/staker_out.html")
		end
	end

end
