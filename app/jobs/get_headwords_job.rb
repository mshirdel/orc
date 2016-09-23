class GetHeadwordsJob < ActiveJob::Base
	include DictionaryHelper
  queue_as :default

  def perform(*args)
    HeadwordJob.where(:is_done => false).each do |hw|
    	if(get_dic(hw.head_word) == 1)
    		hw.is_done= true
    		hw.save
    	end
    end
  end
end
