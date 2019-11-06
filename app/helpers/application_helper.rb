module ApplicationHelper
  def active_link_to(name = nil, path = nil, html_options = nil, &block)
    active_class = html_options&['active'] || 'active'
    html_options&.delete(:active)
    html_options[:class] = "#{html_options[:class]} #{active_class}" if current_page?(path)
    link_to(name, path, html_options, &block)
  end

  def active_link_with_block(path = nil, html_options = nil, &block)
    active_class = html_options[:active] || 'active'
    html_options.delete(:active)
    html_options[:class] = "#{html_options[:class]} #{active_class}" if current_page?(path)
    link_to(path, html_options, &block)
  end
end
