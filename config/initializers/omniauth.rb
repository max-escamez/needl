OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '604414130468-jq3fq2nv422l1l3pr0ffp1j4p0pv6001.apps.googleusercontent.com', '0L5D6kp4p-sVqkyh5AMzzGJP', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end