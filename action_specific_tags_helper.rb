module ActionSpecificTagsHelper

  def action_specific_javascript_include_tag
    filename = "#{params[:controller]}/#{params[:action]}.js"
    javascript_include_tag filename if File.exists?("#{RAILS_ROOT}/public/javascripts/#{filename}")
  end

  def action_specific_stylesheet_link_tag
    filename = "#{params[:controller]}/#{params[:action]}.css"
    stylesheet_link_tag filename if File.exists?("#{RAILS_ROOT}/public/stylesheets/#{filename}")
  end

  def action_specific_assets_tags
    "#{page_specific_javascript_include_tag}\n#{page_specific_stylesheet_link_tag}"
  end

end

ActionView::Helpers::AssetTagHelper.send(:include, ActionSpecificTagsHelper)
