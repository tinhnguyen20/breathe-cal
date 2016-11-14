OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, '140496364556-f0lvk46ni0jm0ke4k41nfnlp5mj7j8tl.apps.googleusercontent.com', 'MwCvNxkg-R0Bn71lwRy_y_Xe',
    {client_options: {ss1: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
