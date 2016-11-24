module Api
  module V1
    class CmsController < ApplicationController
      

      def groups
        @groups = Group.all
        render json: @groups
      end

      def lessons
        group = Group.find(params[:id])
        render json: group.lessons unless group.lessons.nil?
        p "$> #{params.inspect}"
      end

    end
  end
end