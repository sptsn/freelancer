require 'dry/monads/result'
require 'dry/monads/do'

class CreateUser
  include Dry::Monads::Result::Mixin
  include Dry::Monads::Do.for(:call)

  def call(params)
    user = yield create_user(params)
    notify_admin(params)

    Success(user)
  rescue => e
    Failure(e)
  end

  private

  def create_user(params)
    user = User.new(params.slice(:name, :phone, :email))
    if user.save
      Success(user)
    else
      Failure(user)
    end
  end

  def notify_admin(params)
    admin = User.admin.first
    UserMailer.notify_admin(admin, params[:message]).deliver_now if admin.present?
    Success(params)
  end
end
