class UsersController < ApplicationController
    def index
        @users = User.all
        # This action will render users/index.html.erb by default
    end

end