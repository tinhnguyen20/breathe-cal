Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '1805039493049280', '37889cc67a99baba51765b8335dc1a8b'
end