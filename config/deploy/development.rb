set :stage, :development
set :rails_env, :development
set :normalize_asset_timestamps, %{public/images public/javascripts public/stylesheets}
role :app, %w{ubuntu@54.255.181.26}
set :ssh_options, {
   forward_agent: true ,
   user: "ubuntu"
}