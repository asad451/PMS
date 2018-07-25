module ClientsHelper

  def change_client_submit_button(client)
    if (client.new_record?)
      content_tag :div, class: "action" do
        button_tag("Add Client", type: 'submit', class: 'btn btn-primary')
      end
    else
      content_tag :div, class: "action" do
        button_tag("Update Client", type: 'submit', class: 'btn btn-primary')
      end
    end
  end

end
