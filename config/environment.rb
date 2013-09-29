# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Pain::Application.initialize!



ActionView::Base.field_error_proc = Proc.new do |html_tag, instance_tag|
  errors = Array(instance_tag.error_message).join(',')
  if html_tag =~ /^<label/
    html_tag
  else
  	%(<span class='error'>#{html_tag}<small>#{errors}</small></span>).html_safe
  end
end
