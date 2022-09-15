# frozen_string_literal: true

module DroneCI
  module UsersAPI
    # Creates a user.
    #
    # Please note this api requires administrative privileges.
    #
    # Reference: https://docs.drone.io/api/users/users_create/
    def users_create(**body)
      api.post('users', body)
    end

    # Deletes a user.
    #
    # Please note this api requires administrative privileges.
    #
    # Reference: https://docs.drone.io/api/users/users_delete/
    def users_delete(login)
      api.delete("users/#{login}")
    end

    # Returns information about the named registered user.
    #
    # Please note this api requires administrative privileges.
    #
    # Reference: https://docs.drone.io/api/users/users_info/
    def users_info(login)
      api.get("users/#{login}")
    end

    # Returns a list of all registered users.
    #
    # Please note this api requires administrative privileges.
    #
    # Reference: https://docs.drone.io/api/users/users_list/
    def users_list
      api.get('users')
    end

    # Updates the specified user.
    #
    # Please note this api requires administrative privileges.
    #
    # Reference: https://docs.drone.io/api/users/users_update/
    def users_update(login, **body)
      api.patch("users/#{login}", body)
    end
  end
end
