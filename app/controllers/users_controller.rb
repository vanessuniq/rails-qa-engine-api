class UsersController < ApplicationController
    def create
        user = User.new(user_params)
        if user.save
            payload = {user_id: user.id}
            token = encode_token(payload)
            render json: UserSerializer.new(user).serializable_hash, jwt: token
        else
            render json: {errors: user.errors.full_messages}, status: :not_acceptable
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
    
    
end
