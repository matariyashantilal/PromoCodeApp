json.array!(@setting_contents) do |setting_content|
  json.extract! setting_content, :id, :terms_condition, :about_us
  json.url setting_content_url(setting_content, format: :json)
end
