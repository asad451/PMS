module ProjectsHelper

  def change_project_submit_button(project)
    if (project.new_record?)
      content_tag :div, class: "action" do
        button_tag("Add Project", type: 'submit', class: 'btn btn-primary')
      end
    else
      content_tag :div, class: "action" do
        button_tag("update Project", type: 'submit', class: 'btn btn-primary')
      end
    end
  end

end
