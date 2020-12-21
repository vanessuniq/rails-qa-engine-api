class StaticController < ApplicationController
    skip_before_action :require_login
    def home
        render json: {status: 'Welcome to United Wed Dev API!'}
    end
    
    
end