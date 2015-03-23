json.data do
json.user_id @user.id
json.email @user.email
json.first_name @user.first_name
json.last_name @user.last_name
json.is_notification_enable @user.is_notification_enable
json.extract! @authentication_token, :auth_token
end