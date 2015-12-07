domains.each do |d|
    letsencrypt_request domain do
        action :standalone
    end
end
