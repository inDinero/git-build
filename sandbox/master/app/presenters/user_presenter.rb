class UserPresenter
  def initialize(options = {})
    @user = options[:user]
  end

  def to_h
    @hash ||= @user.attributes.except(:created_at, :updated_at)
  end
end
