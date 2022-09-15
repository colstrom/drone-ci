# frozen_string_literal: true

module DroneCI
  module UserAPI
    # Returns the currently authenticated user’s build feed.
    #
    # Reference: https://docs.drone.io/api/user/user_builds/
    def user_builds
      api.get('user/builds')
    end

    # Returns the currently authenticated user.
    #
    # Reference: https://docs.drone.io/api/user/user_info/
    def user_info
      api.get('user')
    end

    # Returns the currently authenticated user’s repository list.
    #
    # Optionally, include the latest build for each active repository.
    #
    # Reference: https://docs.drone.io/api/user/user_repos/
    def user_repos(latest: nil)
      api.get('user/repos') do |request|
        { latest: latest }.compact.each do |key, value|
          request.params[key] = value
        end
      end
    end

    # Synchronize the currently authenticated user’s repository list.
    #
    # Reference: https://docs.drone.io/api/user/user_sync/
    def user_sync(async: nil)
      api.post('user/repos') do |request|
        { async: async }.compact.each do |key, value|
          request.params[key] = value
        end
      end
    end

    # Undocumented endpoint.
    #
    # Route Reference: https://github.com/harness/drone/blob/master/handler/api/api.go#L324
    # Code Reference: https://github.com/harness/drone/blob/master/handler/api/user/token.go
    def user_token(rotate: nil)
      api.post('user/token') do |request|
        { rotate: rotate }.compact.each do |key, value|
          request.params[key] = value
        end
      end
    end
  end
end
