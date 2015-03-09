json.result do
  json.messages "ok"
  json.rstatus  "1"
  json.errorcode ""
end

json.partial! 'api/v1/indorse/users/user', :@user=> @user