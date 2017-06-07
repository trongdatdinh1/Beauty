module ApplicationHelper
  def full_title page_title = ""
    base_title = t "title"
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def resource
    @resource ||= User.new
    @resource.build_profile
    @resource
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
