class MainController < ApplicationController
	def index
	end

	def contact
	end

	def search
		@headwords = Headword.where(:headword => params[:q])
	end
end
