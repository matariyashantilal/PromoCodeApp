//
//  VPXAPI_Constants.h


#ifndef VPXAPI_Constants_h
#define VPXAPI_Constants_h

//>---------------------------------------------------------------------------------------------------
//>     PatientSurvey API
//>---------------------------------------------------------------------------------------------------
//http://hope.demo.complitech.net/api/hope/login
//http://hope.demo.complitech.net/api_help/index
#define K_API_MAIN_URL                                          @"http://hope.demo.complitech.net/api/hope"
//#define K_API_MAIN_URL                                          @"http://192.168.1.22:4000/api"
//#define K_API_MAIN_URL                                          @"http://192.168.1.27:4000/api"


//#define K_API_MAIN_HOST_NAME                                    @"192.168.1.22:4000/"
//#define K_API_MAIN_HOST_NAME                                    @"192.168.1.27:4000/"
#define K_API_MAIN_HOST_NAME                                    @"hope.demo.complitech.net"

#define kHTTP_GET_Method                             @"GET"
#define kHTTP_POST_Method                            @"POST"
#define kHTTP_PUT_Method                             @"PUT"
#define kHTTP_DELETE_Method                          @"DELETE"

#define kAPI_Response_Result                         @"result"
#define kAPI_Response_Result_Status                  @"rstatus"
#define kAPI_Response_Result_ErrorCode               @"errorcode"
#define kAPI_Response_Message                        @"messages"
#define kAPI_Response_Data                           @"data"


#define k_API_User_add_activity                      @"api/hope/add_activity"
#define k_API_User_Search                            @"api/hope/search_users"
#define k_API_User_Login                             @"api/hope/login"
#define k_API_User_Logout                            @"api/hope/logout"
#define k_API_User_Signup                            @"api/hope/sign_up"
#define k_API_User_ForgetPassword                    @"api/hope/forgot_password"
#define k_API_User_ResetPassword                     @"api/hope/change_password"
#define k_API_UpdateProfile                          @"api/hope/update_profile"
#define k_API_Create_Gallery                         @"api/hope/create_gallery"
#define k_API_Show_Gallery                           @"api/hope/show_all_gallery"
#define k_API_User_Purchase                          @"api/hope/purchase"
#define k_API_EditActivity_Review                     @"api/hope/edit_activity"

#define k_API_GetChatMessage    @"api/chat_message"
#define k_API_GetChatList @"api/recent_chat_list"

#define kAPI_ErrorCode_110                                      @"110"

//>     Result Success => "1"/ Failure => "0"
#define kAPI_Response_Result_Success                            @"1"
#define kAPI_Response_Result_Failure                            @"0"

#endif
