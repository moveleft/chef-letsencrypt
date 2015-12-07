domains.each do |d|
    letsencrypt_request domain do
        action :webroot
    end
end
