module Api
  module V1
    class CmsController < ApplicationController
      

      def groups
        @groups = Group.all
        respond_to do |format|
          format.json {render json: @groups }
        end
      end

    end
  end
end