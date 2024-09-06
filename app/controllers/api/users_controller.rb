module Api
    class UsersController < ApiController
      def index
        users = User.all
        render json: users.as_json(only: [:id, :first_name, :last_name, :username, :email, :created_at, :updated_at])
        # render json: users
      end

      def create 
        @user = User.new(user_params)
        if @user.save
            # render json: @user.as_json
            render json: { success: true, user: @user, message: "User was successfully created!" }, status: :created
        else 
            render json: { 
                success: false,
                message: "Error, issue saving user, was not successfully created!", 
                errors: @user.errors.full_messages.join(', ')
            }, status: :unprocessable_entity
        end
      end

      # Note: Old faulty version
      # def create 
      #     @user = User.create(user_params)
      #     if @user.save
      #         # render json: @user.as_json
      #         render json: { message: "User was successfully created!"}
      #     else 
      #         render json: { message: "Error, issue saving user, was not successfully created!", errors: @user.errors.full_messages }
      #     end
      # end

    private

      def user_params
          params.require(:user).permit(:username, :email, :password, :first_name, :last_name)
          # :password_digest
          # :username
      end

    end
end

# Available user params in user.rb model
# ["id", "username", "email", "password_digest", "first_name", "last_name", "created_at", "updated_at"]

# Test
# User.create(email: "jane@example.com", username: "Jane", password_digest: "password", first_name: "Jane", last_name: "Test")

# User.create(first_name: "John", last_name: "Test", email: "john@example.com", password_digest: "passwordtest")
# User.create(email: "john@example.com", password: "password", first_name: "john", last_name: "the tester", username:"testuser_0001")
# User.create(username: "John", email: "john@example.com")