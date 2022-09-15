# frozen_string_literal: true

module DroneCI
  module ReposAPI
    # Lets a user assume ownership of a named repository.
    #
    # Please note this api requires administrative access to the repository.
    #
    # Reference: https://docs.drone.io/api/repos/repo_chown/
    def repo_chown(owner, repo)
      api.post("repos/#{owner}/#{repo}/chown")
    end

    # Permanently deletes a repository. It cannot be undone.
    #
    # Please note this api requires administrative access to the repository, and repository’s secrets and builds aren’t deleted.
    #
    # Reference: https://docs.drone.io/api/repos/repo_delete/
    def repo_delete(owner, repo, remove: nil)
      api.delete("repos/#{owner}/#{repo}") do |request|
        { remove: remove }.compact.transform_keys(&:to_s).each do |key, value|
          request[key] = value
        end
      end
    end

    alias repo_disable repo_delete

    # Registers a named repository with Drone.
    #
    # Please note this api requires administrative access to the repository.
    #
    # Reference: https://docs.drone.io/api/repos/repo_create/
    def repo_create(owner, name)
      api.post("repos/#{owner}/#{name}")
    end

    alias repo_enable repo_create

    # Retrieves the details of a repository.
    #
    # Please note this api requires read access to the repository.
    #
    # Reference: https://docs.drone.io/api/repos/repo_info/
    def repo_info(owner, repo)
      api.get("repos/#{owner}/#{repo}")
    end

    # Returns repositories which are registered to Drone.
    #
    # Reference: https://docs.drone.io/api/repos/repo_list/
    # the docs are wrong, they say this is at api/user/repos, but the source code says...
    # https://github.com/harness/drone/blob/2d45d90cdd5cf2ec0e8dbcce2ea6bc340ce1e67e/handler/api/api.go#L173-L182
    def repo_list(page: 1, per_page: 25)
      api.get('repos') do |request|
        { page: page, per_page: per_page }.compact.transform_keys(&:to_s).each do |key, value|
          request[key] = value
        end
      end
    end

    # Recreates webhooks for your repository in your version control system (e.g GitHub). This can be used if you accidentally delete your webhooks.
    #
    # Please note this api requires administrative access to the repository.
    #
    # Reference: https://docs.drone.io/api/repos/repo_repair/
    def repo_repair(owner, repo)
      api.post("repos/#{owner}/#{repo}/repair")
    end

    # Updates a named repository.
    #
    # Please note this api requires administrative access to the repository.
    #
    # Reference: https://docs.drone.io/api/repos/repo_update/
    def repo_update(owner, repo, **body)
      api.patch("repos/#{owner}/#{repo}", body)
    end
  end
end
