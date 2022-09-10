# frozen_string_literal: true

module DroneCI
  module ReposAPI
    # https://docs.drone.io/api/repos/repo_chown/
    def repo_chown(owner, repo)
      api.post("repos/#{owner}/#{repo}/chown")
    end

    # https://docs.drone.io/api/repos/repo_delete/
    def repo_delete(owner, repo)
      api.delete("repos/#{owner}/#{repo}")
    end

    alias repo_disable repo_delete

    # https://docs.drone.io/api/repos/repo_create/
    def repo_create(owner, _name)
      api.post("repos/#{owner}/#{repo}")
    end

    alias repo_enable repo_create

    # https://docs.drone.io/api/repos/repo_info/
    def repo_info(owner, repo)
      api.get("repos/#{owner}/#{repo}")
    end

    # https://docs.drone.io/api/repos/repo_list/
    # the docs are wrong, they say this is at api/user/repos, but the source code says...
    # https://github.com/harness/drone/blob/2d45d90cdd5cf2ec0e8dbcce2ea6bc340ce1e67e/handler/api/api.go#L173-L182
    def repo_list(_owner)
      api.get('repos')
    end

    # https://docs.drone.io/api/repos/repo_repair/
    def repo_repair(owner, repo)
      api.post("repos/#{owner}/#{repo}/repair")
    end

    # https://docs.drone.io/api/repos/repo_update/
    def repo_update(owner, repo, **body)
      api.patch("repos/#{owner}/#{repo}", body)
    end
  end
end
