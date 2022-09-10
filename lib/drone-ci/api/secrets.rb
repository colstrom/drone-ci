# frozen_string_literal: true

module DroneCI
  module SecretsAPI
    # https://docs.drone.io/api/secrets/secret_create/
    def secret_create(owner, repo, **body)
      api.post("repos/#{owner}/#{repo}/secrets", body)
    end

    # https://docs.drone.io/api/secrets/secret_delete/
    def secret_delete(owner, repo, secret)
      api.post("repos/#{owner}/#{repo}/secrets/#{secret}")
    end

    # https://docs.drone.io/api/secrets/secret_info/
    def secret_info(owner, repo, secret)
      api.get("repos/#{owner}/#{repo}/secrets/#{secret}")
    end

    # https://docs.drone.io/api/secrets/secret_list/
    def secret_list(owner, repo)
      api.get("repos/#{owner}/#{repo}/secrets")
    end

    # https://docs.drone.io/api/secrets/secret_update/
    def secret_update(owner, repo, secret, **body)
      api.patch("repos/#{owner}/#{repo}/secrets/#{secret}", body)
    end
  end
end
