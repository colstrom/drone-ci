# frozen_string_literal: true

module DroneCI
  module UserAPI
    # https://docs.drone.io/api/user/user_builds/
    def user_builds
      api.get('user/builds')
    end

    # https://docs.drone.io/api/user/user_info/
    def user_info
      api.get('user')
    end

    # https://docs.drone.io/api/user/user_repos/
    def user_repos(latest: nil)
      api.get('user/repos') do |request|
        { latest: latest }.compact.each do |key, value|
          request.params[key] = value
        end
      end
    end

    # https://docs.drone.io/api/user/user_sync/
    def user_sync
      api.post('user/repos')
    end
  end
end
