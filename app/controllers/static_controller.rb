class StaticController < ApplicationController
    def home
        render json: {status: 'Welcome to QA Engine Backend API!'}
    end
    
    
end