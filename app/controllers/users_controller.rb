class UsersController < ApplicationController
    skip_before_action :authenticate_request
    before_action :set_user, only: [:show, :update, :destroy]

    def index
      @users = User.all
      render json: @users.except(:password_digest)
    end

    def show
      render json: @user
    end

    def create
      @user = User.create(user_params)
      if @user
        render json: @user, status: :created, location: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    def update
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    def technicians
      @users = User.where(role: :technician)
      render json: @users
    end

    def customers
      @users = User.where(role: :customer)
      render json: @users
    end

    def destroy
      @user.destroy
    end

    private
      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.permit(:first_name, :last_name, :username, :password, :role, :gender, :image)
      end
  end
