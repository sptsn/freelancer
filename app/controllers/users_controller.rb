require 'dry/monads/result'

class UsersController < ApplicationController
  def create
    result = CreateUser.new.call(params.permit(:name, :phone, :email, :message))

    case result
    when Dry::Monads::Success
      render body: nil, status: 200
    else
      render body: nil, status: 422
    end
  end
end
