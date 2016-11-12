# Capistrano restart task
namespace :merhylstudio do 
  desc 'Restart httpd when publishing is completed'
    task :restart do
      on roles(:web), in: :sequence, wait: 5 do
        # Restart mechanism here
        execute :touch, release_path.join('tmp/restarted.txt')
        run 'systemctl restart httpd'
    end
  end
end

namespace :deploy do
  after :publishing, 'merhylstudio:restart'
end
