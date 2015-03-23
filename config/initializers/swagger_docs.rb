class Swagger::Docs::Config
  def self.base_api_controller; Api::V1::BaseController end
end


Swagger::Docs::Config.register_apis({
  "1.0" => {:controller_base_path => "", :api_file_path => "public"}
})