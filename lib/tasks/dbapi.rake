namespace :dbapi do
  
  task geth: :environment do
  	puts 'get headword please wait...'
  	head_word = "outgoing"

		url = "api.pearson.com"
		url_parameter = "/v2/dictionaries/ldoce5/entries?headword=#{head_word}&apikey=02PpCoWHvo4KUszy4lx2jUAChqCwHIgO"

		response = Net::HTTP.get_response(url,url_parameter)
		obj = JSON.parse(response.body)

		unless obj.nil?
			pearson = Pearson.create(
				word: head_word,
				response: obj
			)
		end

		for result in obj["results"]
			headword = Headword.create(
				dataset: result["datasets"].inspect,
				headword: result["headword"],
				headword_id: result["id"],
				part_of_speech: result["part_of_speech"],
				url: result["url"]
			)
			unless result["pronunciations"].nil?
				result["pronunciations"].each do |p|
					pronunciation = Pronounciation.create(:ipa => p["ipa"] , :headword_id => headword.id)
					p["audio"].each do |a|
						audio = Audio.create(:lang => a["lang"], :p_type => a["type"], :url => a["url"], :pronounciation_id => pronunciation.id)
					end
				end
			end
			unless result["senses"].nil?
				result["senses"].each do |sense|
					sense_obj = Sense.create(:headword_id => headword.id, :definition => sense["definition"], :opposite => sense["opposite"])					
					unless sense["examples"].nil?
						sense["examples"].each do |example|
							puts example
							example_audio = example["audio"]
							# example = Example.create(:sense_id => sense_obj.id, :text => example["text"], :audio_type => example_audio["type"], :audio_url => example_audio["url"])
							example = Example.create(:sense_id => sense_obj.id, :text => example["text"])
							
						end
					end
				end
			end
		end
  end

end
