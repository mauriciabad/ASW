OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '528231887440-7e4vt8s3l220de8fuokb6e7ghek6onu6.apps.googleusercontent.com', 'oORHIa8XCyDDigpecCcqAGcv', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
