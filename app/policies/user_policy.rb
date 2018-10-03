class UserPolicy
  attr_reader :user, :passed_user

  def initialize(user, passed_user)
    @user = user
    @passed_user = passed_user
  end

  def index?
    user.id == passed_user.id
  end

  def create?
    user.id == passed_user.id
  end
end
