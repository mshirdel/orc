class GetHeadwordsJob < ActiveJob::Base
	include DictionaryHelper
  queue_as :default

  def perform(*args)
    HeadwordJob.where(:is_done => false).each do |hw|
    	get_dic hw.head_word
    	hw.is_done= true
    	hw.save
    end
  end
end
