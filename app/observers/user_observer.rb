class UserObserver < ActiveRecord::Observer
  def after_commit(user)
    UserMailer.welcome_email(user).deliver if new_user?(user)
  end

  private
    def new_user?(user)
      user.previous_changes.has_key?(:id)
    end
end
