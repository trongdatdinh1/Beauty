module TagListHelper
  def tag_list post
    post.tag_list.map do |ta|
      link_to ta, tag_path(ta),
        class: "btn-md btn-default"
    end.join(" ")
  end
end
