namespace :dbapi do
  
  task geth: :environment do
  	puts 'get headword please wait...'
  	head_word = "cheap"

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
			# puts headword.id;
			unless result["pronunciations"].nil?
				result["pronunciations"].each do |p|
					# pronunciation = Pronounciation.create(:ipa => p["ipa"] , :headword_id => 1)
					p["audio"].each do |a|
						# audio = Audio.create(:lang => a["lang"], :p_type => a["type"], :url => a["url"], :pronounciation_id => 1)
					end
				end
			end
			unless result["senses"].nil?				
				result["senses"].each do |sense|
					sense = Sense.create(:headword_id => 1, :definition => sense["definition"], :opposite => sense["opposite"])
					unless sense["example"].nil?						
						sense["examples"].each do |example|
							example = Example.create(:sense_id => sense.id, :text => example["text"], :audio_type => example["audio_type"], :audio_url => ["audio_url"])
						end
					end
					# puts "******************************"
				end
			end
			# senses = result["senses"]
			# for sense in senses
			# 	puts "> #{sense["definition"]}"
			# end
		end
  end

end
