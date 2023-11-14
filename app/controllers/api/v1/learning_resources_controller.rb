class Api::V1::LearningResourcesController < ApplicationController
    def index
      resources = ResourceFacade.new.find_resources(params[:country])
      render json: ResourceSerializer.new(resources)
    end
end