module ApplicationHelper

  def show_profile_picture
    if user_signed_in? && current_user.avatar?
      image_tag current_user.avatar.url(:medium), class: "profile-pic"
    end
  end

end
