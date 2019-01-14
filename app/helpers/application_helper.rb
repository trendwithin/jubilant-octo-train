module ApplicationHelper

  def navigation_links
    if user_signed_in? && current_user.admin?
      'layouts/navigation/links/navigation_links'
    else
      'shared/empty'
    end
  end

  def logout_link
    if user_signed_in? && current_user.admin?
      'layouts/navigation/links/signed_in_links'
    else
      'shared/empty'
    end
  end
end
