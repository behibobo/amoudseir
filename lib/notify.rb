class Notify
  class << self
    def user(to, notification)
      fcm = FCM.new('AAAApe0tnzk:APA91bFppdbmBNvhPKgBHlJTl7Tg041ZtsYOt6wAgQlfz8g39WdBle_7C7A2JQ4T1pAlE2mXHeG7OkslWMBGABOPvqToZQos_wFMlHXAb_N3oL-QSLmdhX5Ytqqat72pE_ayyPXVdK3U')

      registration_ids= [to] 

      options = {
              priority: "high",
              collapse_key: "updated_score", 
              notification: {
                  title: notification.title, 
                  body: notification.body,
                  icon: notification.icon}
              }
      response = fcm.send(registration_ids, options)
    end

    def group(group_type, notification)
      fcm = FCM.new('AAAApe0tnzk:APA91bFppdbmBNvhPKgBHlJTl7Tg041ZtsYOt6wAgQlfz8g39WdBle_7C7A2JQ4T1pAlE2mXHeG7OkslWMBGABOPvqToZQos_wFMlHXAb_N3oL-QSLmdhX5Ytqqat72pE_ayyPXVdK3U')
      registration_ids = []
      user = User.all
      if group_type == 'technician'
        registration_ids = user.where(role: :technician).pluck(:firebase_token)
      elsif group_type == 'customer'
        registration_ids = user.where(role: :customer).pluck(:firebase_token)
      else
        user.pluck(:firebase_token)
      end

      options = {
              priority: "high",
              collapse_key: "updated_score", 
              notification: {
                  title: notification.title, 
                  body: notification.body,
                  icon: notification.icon}
              }
      response = fcm.send(registration_ids, options)
    end
  end
end
  