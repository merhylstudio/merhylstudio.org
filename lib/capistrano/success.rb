# Capistrano success task
namespace :merhylstudio do
  desc 'Says a message when deployment is completed'
  task :success do
    puts 'Deployment Completed! Good Job!'
  end
end

after :deploy, 'merhylstudio:success'
