module HeaderHelper
  ACTION_LABEL_MAP = {
    about: "Mission",
    index: "View All Notes",
    new: "Report New Crime"
  }

  def header_nav_link(action)
    label = ACTION_LABEL_MAP[action]
    if action == :about
      url = about_path
    elsif action == :index
      url = :notes
    elsif action == :new
      url = :new_note
    end

    html_classes = %w(nav-link)
    html_classes << "active" if action.to_s == action_name

    link_to label, url, class: html_classes.join(' ')
  end
end
