namespace :forever do
  task :start do
    on roles fetch(:npm_roles) do
      within fetch(:npm_target_path, release_path) do
        with fetch(:npm_env_variables, {}) do
          execute :npm, 'start'
        end
      end
    end
  end

  task :stop do
    on roles fetch(:npm_roles) do
      within fetch(:npm_target_path, release_path) do
        with fetch(:npm_env_variables, {}) do
          execute :npm, 'stop'
        end
      end
    end
  end

  task :restart do
    on roles fetch(:npm_roles) do
      within fetch(:npm_target_path, release_path) do
        with fetch(:npm_env_variables, {}) do
          result = capture("cd #{current_path} && npm run check").split("\n").last
          p result
          if result.to_i === 0
            execute :npm, 'start'
          else
            execute :npm, 'restart'
          end
        end
      end
    end
  end
end
