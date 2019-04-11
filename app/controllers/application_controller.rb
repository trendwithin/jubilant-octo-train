class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include CurrentUserConcern
  include NullReportConcern
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private

    def user_not_authorized
      flash[:alert] = "Oops! Something went wrong. If problem persist email admin"
      redirect_to(request.referrer || root_path)
    end
end
