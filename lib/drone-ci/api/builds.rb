# frozen_string_literal: true

module DroneCI
  module BuildsAPI
    # Approves a blocked build.
    #
    # Please note this api requires write access to the repository, and the request parameter {build} is not the build id but the build number.
    #
    # Reference: https://docs.drone.io/api/builds/build_approve/
    def build_approve(owner, repo, build)
      api.post("repos/#{owner}/#{repo}/builds/#{build}/approve")
    end

    # Create a build using the latest commit for the specified branch.
    #
    # Please note the resulting build is created with event type `custom`.
    #
    # Reference: https://docs.drone.io/api/builds/build_create/
    def build_create(namespace, name, branch: nil, commit: nil, **params)
      api.post("repos/#{namespace}/#{name}/builds") do |request|
        { branch: branch, commit: commit }.merge(params).compact.transform_keys(&:to_s).each do |key, value|
          request.params[key] = value
        end
      end
    end

    # Declines a blocked build.
    #
    # Please note this api requires write access to the repository, and the request parameter {build} is not the build id but the build number.
    #
    # Reference: https://docs.drone.io/api/builds/build_decline/
    def build_decline(owner, repo, build)
      api.post("repos/#{owner}/#{repo}/builds/#{build}/decline")
    end

    # Returns the specified repository build.
    #
    # Please note this api requires read access to the repository and the request parameter {build} is not the build id but the build number.
    #
    # Reference: https://docs.drone.io/api/builds/build_info/
    def build_info(owner, repo, build)
      api.get("repos/#{owner}/#{repo}/builds/#{build}")
    end

    # Returns recent builds for the repository based on name.
    #
    # Please note this api requires read access to the repository.
    #
    # Reference: https://docs.drone.io/api/builds/build_list/
    def build_list(owner, repo, branch: nil, tag: nil, page: 1, per_page: 25)
      api.get("repos/#{owner}/#{repo}/builds") do |request|
        {
          branch: branch,
          commit: commit,
          page: page,
          per_page: [[per_page, 1].max, 100].min, # https://github.com/harness/drone/blob/cbfd342333ffa4b2fe76b7e8948235efd3535fac/handler/api/repos/builds/list.go#L45-L47
        }.compact.transform_keys(&:to_s).each do |key, value|
          request.params[key] = value
        end
      end
    end

    # Please note this api requires read access to the repository.
    #
    # Reference: https://docs.drone.io/api/builds/build_logs/
    def build_logs(owner, repo, build, stage, step)
      api.get("repos/#{owner}/#{repo}/builds/#{build}/logs/#{stage}/#{step}")
    end

    # Promote the specified build number to the target environment.
    #
    # If given, additional (custom) parameters will be available to your pipeline steps as environment variables.
    #
    # Please note this api requires write access to the repository.
    #
    # Reference: https://docs.drone.io/api/builds/build_promote/
    def build_promote(owner, repo, build, target:)
      api.post("repos/#{owner}/#{repo}/builds/#{build}") do |request|
        { target: target }.compact.transform_keys(&:to_s).each do |key, value|
          request.params[key] = value
        end
      end
    end

    # Restart the specified build.
    #
    # Please note this api requires read and write access to the repository and the request parameter {build} is not the build id but the build number.
    #
    # Reference: https://docs.drone.io/api/builds/build_start/
    def build_start(owner, repo, build)
      api.post("repos/#{owner}/#{repo}/builds/#{build}")
    end

    alias build_restart build_start

    # Stop the specified build.
    #
    # Please note this api requires administrative privileges and the request parameter {build} is not the build id but the build number.
    #
    # Reference: https://docs.drone.io/api/builds/build_stop/
    def build_stop(owner, repo, build)
      api.delete("repos/#{owner}/#{repo}/builds/#{build}")
    end
  end
end
