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
    def user_sync
      api.post('user/repos')
    end
  end
end
