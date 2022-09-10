# frozen_string_literal: true

module DroneCI
  module UsersAPI
    # https://docs.drone.io/api/users/users_create/
    def users_create(**body)
      api.post('users', body)
    end

    # https://docs.drone.io/api/users/users_delete/
    def users_delete(login)
      api.delete("users/#{login}")
    end

    # https://docs.drone.io/api/users/users_info/
    def users_info(login)
      api.get("users/#{login}")
    end

    # https://docs.drone.io/api/users/users_list/
    def users_list
      api.get('users')
    end

    # https://docs.drone.io/api/users/users_update/
    def users_update(login, **body)
      api.patch("users/#{login}", body)
    end
  end
end
