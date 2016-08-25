module ApplicationHelper
  def sign_in_button
    link_to '/auth/github', class: "link f3 f4-ns f6-m small-caps ph4 pv3 br2 dib bg-purple white grow" do
      concat content_tag(:i, "", class: "fa fa-github")
      concat "&nbsp; Sign in with GitHub".html_safe
    end
  end
end
