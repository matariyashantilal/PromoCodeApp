json.result do
json.messages "ok"
json.rstatus  "1"
json.errorcode ""
end
json.data do
json.user_id @user.id
json.email @user.email
json.first_name @user.first_name
json.last_name @user.last_name
json.role @user.role
json.provider @user.provider
json.ftoekn @user.ftoken
json.extract! @authentication_token, :auth_token
end