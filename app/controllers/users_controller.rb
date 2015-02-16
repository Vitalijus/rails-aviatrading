class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:index, :edit]

	def show
		@user = User.find(params[:id])
	end
end