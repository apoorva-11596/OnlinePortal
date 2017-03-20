Rails.application.config.middleware.use OmniAuth::Builder do
  config.omniauth :facebook, "256330194776720", "b29bf4bfdb352ac00013c4779fc5f536"
end