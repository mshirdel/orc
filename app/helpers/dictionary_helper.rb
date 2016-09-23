module DictionaryHelper
	def get_dic(head_word)
		begin 
			puts 'get headword please wait...'
			url = "api.pearson.com"
			url_parameter = "/v2/dictionaries/ldoce5/entries?headword=#{head_word}&apikey=02PpCoWHvo4KUszy4lx2jUAChqCwHIgO"
			response = Net::HTTP.get_response(url,url_parameter)
			obj = JSON.parse(response.body)

			unless obj.nil?
				pearson = Pearson.create(word: head_word,response: obj)
				for result in obj["results"]
					headword = Headword.create(dataset: result["datasets"].inspect, headword: result["headword"], headword_id: result["id"], part_of_speech: result["part_of_speech"], url: result["url"])
					unless result["pronunciations"].nil?
						result["pronunciations"].each do |p|
							pronunciation = Pronounciation.create(:ipa => p["ipa"] , :headword_id => headword.id)
							unless p["audio"].nil?
								p["audio"].each do |a|
									audio = Audio.create(:lang => a["lang"], :p_type => a["type"], :url => a["url"], :pronounciation_id => pronunciation.id)
								end							
							end
						end
					end
					unless result["senses"].nil?
						result["senses"].each do |sense|
							sense_obj = Sense.create(:headword_id => headword.id, :definition => sense["definition"], :opposite => sense["opposite"])					
							unless sense["examples"].nil?
								sense["examples"].each do |example|
									example_audio = example["audio"]
									# example = Example.create(:sense_id => sense_obj.id, :text => example["text"], :audio_type => example_audio["type"], :audio_url => example_audio["url"])
									example = Example.create(:sense_id => sense_obj.id, :text => example["text"])								
								end
							end
						end
					end
				end
				1
			else
				-1
			end
		rescue
				-1
		end		
	end

	def get_unique_words(data)
		all_words = data.split(/\W+/)
		all_words_with_count = all_words.inject(Hash.new(0)) { |h, e| h[e] += 1 ; h }
		all_words_with_count.keys.map { |k| k.downcase }		
	end

	def enque_headwords(body)
		get_unique_words(body).each do |word| 
			begin
				HeadwordJob.create(:head_word => word, :is_done => false)
			rescue ActiveRecord::RecordNotUnique
			end			
		end
		GetHeadwordsJob.set(wait: 1.minute).perform_later
	end
end