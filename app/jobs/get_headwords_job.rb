class GetHeadwordsJob
  @queue = :default

  def self.perform(data)
    ::ApplicationController.helpers.enque_headwords(data)
  end
end
