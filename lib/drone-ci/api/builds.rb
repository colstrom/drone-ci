# frozen_string_literal: true

module DroneCI
  module BuildsAPI
    # https://docs.drone.io/api/builds/build_approve/
    def build_approve(owner, repo, build)
      api.post("repos/#{owner}/#{repo}/builds/#{build}/approve")
    end

    # https://docs.drone.io/api/builds/build_create/
    def build_create(namespace, name, branch: nil, commit: nil, **params)
      api.post("repos/#{namespace}/#{name}/builds") do |request|
        { branch: branch, commit: commit }.merge(params).compact.transform_keys(&:to_s).each do |key, value|
          request.params[key] = value
        end
      end
    end

    # https://docs.drone.io/api/builds/build_decline/
    def build_decline(owner, repo, build)
      api.post("repos/#{owner}/#{repo}/builds/#{build}/decline")
    end

    # https://docs.drone.io/api/builds/build_info/
    def build_info(owner, repo, build)
      api.get("repos/#{owner}/#{repo}/builds/#{build}")
    end

    # https://docs.drone.io/api/builds/build_list/
    def build_list(owner, repo)
      api.get("repos/#{owner}/#{repo}/builds")
    end

    # https://docs.drone.io/api/builds/build_logs/
    def build_logs(owner, repo, build, stage, step)
      api.get("repos/#{owner}/#{repo}/builds/#{build}/logs/#{stage}/#{step}")
    end

    # https://docs.drone.io/api/builds/build_promote/
    def build_promote(owner, repo, build, target:, **params)
      api.post("repos/#{owner}/#{repo}/builds/#{build}") do |request|
        { target: target }.merge(params).compact.transform_keys(&:to_s).each do |key, value|
          request.params[key] = value
        end
      end
    end

    # https://docs.drone.io/api/builds/build_start/
    def build_start(owner, repo, build)
      api.post("repos/#{owner}/#{repo}/builds/#{build}")
    end

    alias build_restart build_start

    # https://docs.drone.io/api/builds/build_stop/
    def build_stop(owner, repo, build)
      api.delete("repos/#{owner}/#{repo}/builds/#{build}")
    end
  end
end
