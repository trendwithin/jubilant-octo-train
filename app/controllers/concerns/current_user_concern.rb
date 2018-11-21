module CurrentUserConcern
  extend ActiveSupport::Concern

  private

  def current_user
    super || guest_user
  end

  def guest_user
    guest = GuestUser.new
    guest.email = "guest@example.com"
    guest
  end
end
