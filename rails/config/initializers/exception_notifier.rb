if Rails.env == "production"
  require 'exception_notifier'
  STACK_APP_NAME_UPCASE::Application.config.middleware.use ExceptionNotifier,
      :email_prefix => "[STACK_APP_NAME_UPCASE] ",
      :sender_address => %{"STACK_APP_NAME_UPCASE" <m4kevoid@gmail.com>},
      :exception_recipients => %w{makevoid@gmail.com}
end