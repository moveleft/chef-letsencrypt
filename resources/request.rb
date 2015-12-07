property :domain, kind_of: String, name_property: true
property :email, kind_of: String, default: node['letsencrypt']['email']
property :server_url, kind_of: String, default: node['letsencrypt']['server_url']
property :webroot_path, kind_of: String, default: node['letsencrypt']['webroot_path']

def setup_virtualenv()
    virtualenv = node['letsencrypt']['virtualenv_path']

    package 'build-essential'
    package 'libssl-dev'
    package 'libffi-dev'
    package 'python-dev'
    package 'gcc'

    python_runtime '2'
    python_virtualenv virtualenv

    bash "install letsencrypt" do
        code "#{virtualenv}/bin/pip install letsencrypt"
        not_if do ::File.exist? "#{virtualenv}/bin/letsencrypt" end
    end
end

action :standalone do
    setup_virtualenv

    bash "run letsencrypt" do
        code <<-EOF
            #{node['letsencrypt']['virtualenv_path']}/bin/letsencrypt certonly \
                --standalone \
                --standalone-supported-challenges http-01 \
                --server #{server_url} \
                --text \
                --agree-dev-preview \
                --agree-tos \
                --renew-by-default \
                -d #{domain} \
                --email #{email}
        EOF

        not_if do ::File.exists? "/etc/letsencrypt/live/#{domain}/fullchain.pem" end
    end
end

action :webroot do
    setup_virtualenv

    bash "run letsencrypt" do
        code <<-EOF
            #{node['letsencrypt']['virtualenv_path']}/bin/letsencrypt certonly \
                --webroot \
                --webroot-path #{webroot_path} \
                --server #{server_url} \
                --text \
                --agree-dev-preview \
                --agree-tos \
                --renew-by-default \
                -d #{domain} \
                --email #{email}
        EOF

        not_if do ::File.exists? "/etc/letsencrypt/live/#{domain}/fullchain.pem" end
    end
end
