module HeaderHelper
  ACTION_LABEL_MAP = {
    about: " ミッション ",
    index: " 過去の治安・犯罪情報を全てみる ",
    new: " 新しい治安・犯罪情報を作成する "
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
