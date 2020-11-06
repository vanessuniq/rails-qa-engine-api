class StaticController < ApplicationController
    skip_before_action :require_login
    def home
        render json: {status: 'Welcome to QA Engine Backend API!'}
    end
    
    
end