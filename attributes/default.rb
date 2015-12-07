
default['letsencrypt'] = {
    'server_url' => 'https://acme-v01.api.letsencrypt.org/directory',
    'domains' => [],
    'email' => nil,
    'virtualenv_path' => '/opt/letsencrypt-virtualenv',
    'type' => 'standalone',
    'webroot_path' => '/var/letsencrypt/webroot'
}

