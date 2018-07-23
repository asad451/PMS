module Admin::AdminsHelper

  def change_user_status(user)
    return if user.admin?

    if user.enable?
      link_to "Disable", change_status_admin_admin_path(user.id), class: "btn btn-danger"
    else
      link_to "Enable", change_status_admin_admin_path(user.id), class: "btn btn-info"
    end
  end

  def change_user_role(user)
    return if user.admin?

    if user.manager?
      link_to "Remove as Manager", change_role_admin_admin_path(user.id), class: "btn btn-danger"
    else
      link_to "Assign as Manager", change_role_admin_admin_path(user.id), class: "btn btn-success"
    end
  end

end
