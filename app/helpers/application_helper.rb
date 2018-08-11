module ApplicationHelper

  def show_profile_picture
    if user_signed_in? && current_user.avatar?
      image_tag current_user.avatar.url(:medium), class: "profile-pic"
    end
  end

  def homepage_profile_picture
    if user_signed_in? && current_user.avatar?
      image_tag current_user.avatar.url(:thumb), class: "home-profile-pic"
    end
  end

  def render_home_button
    if user_signed_in? && (current_user.admin? || current_user.manager?)
      render 'admin/dashboard/admin_navbar'
    else
      content_tag :li do
        link_to "Home", root_path
      end
    end
  end

  def render_session_button
    if user_signed_in?
      render 'shared/logged_in'
    else
      render 'shared/logged_out'
    end
  end

end
