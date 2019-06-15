class PlatesController < ApplicationController

    def index
        render json: Plate.all
    end

    def show
        render json: Plate.find(params['id'])
    end

    def create
        render json: Plate.create(params['plate'])
    end

    def delete
        render json: Plate.delete(params['id'])
    end
    
end
