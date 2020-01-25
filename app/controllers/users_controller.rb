require 'dry/monads/result'

class UsersController < ApplicationController
  def create
    result = CreateUser.new.call(params.permit(:name, :phone, :email, :message))

    case result
    when Dry::Monads::Success
      redirect_back fallback_location: '/'
    else
      render 'pages/index', status: 422
    end
  end
end
