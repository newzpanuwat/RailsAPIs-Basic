module Api
  module V1
    class UsersController < ApiController

      def index
        users = User.includes(:products)
        render json: users, status: :ok
      end

      def show
        user = User.find(params[:id])
        render json: user, status: :ok
      end

      def create
        user = User.new(user_params)

        if user.save
          render json: user, status: :created
        else
          invalid_resource_error user
        end
      end

      def update
        user = User.find(params[:id])

        if user.update(user_params)
          render json: user, status: :ok
        else
          invalid_resource_error user
        end
      end

      def destroy
        user = User.find(params[:id])
        user.destroy
        head :no_content
      end

      private

      def user_params
        params
          .require(:user)
          .permit(
            :email,
            :password
          )
      end
    end
  end
end
