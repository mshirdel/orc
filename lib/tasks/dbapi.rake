namespace :dbapi do
  
  task geth: :environment do
  	puts 'get headword please wait...'
  	head_word = "expensive"

		url = "api.pearson.com"
		url_parameter = "/v2/dictionaries/ldoce5/entries?headword=#{head_word}&apikey=02PpCoWHvo4KUszy4lx2jUAChqCwHIgO"

		response = Net::HTTP.get_response(url,url_parameter)
		obj = JSON.parse(response.body)

		for result in obj["results"]
			# headword = Headword.create(
			# 	dataset: result["datasets"].inspect,
			# 	headword: result["headword"],
			# 	headword_id: result["id"],
			# 	part_of_speech: result["part_of_speech"],
			# 	url: result["url"]
			# )
			puts result["pronunciations"].count unless result["pronunciations"].nil?
			# senses = result["senses"]
			# for sense in senses
			# 	puts "> #{sense["definition"]}"
			# end
		end
  end

end
