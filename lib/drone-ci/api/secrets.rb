# frozen_string_literal: true

module DroneCI
  module SecretsAPI
    # Create a new repository secret.
    #
    # Please note this api requires write access to the repository.
    #
    # Reference: https://docs.drone.io/api/secrets/secret_create/
    def secret_create(owner, repo, **body)
      api.post("repos/#{owner}/#{repo}/secrets", body)
    end

    # Deletes a repository secret.
    #
    # Please note this api requires write access to the repository, and the request parameter {secret} is not the secret’s id but secret name.
    #
    # Reference: https://docs.drone.io/api/secrets/secret_delete/
    def secret_delete(owner, repo, secret)
      api.post("repos/#{owner}/#{repo}/secrets/#{secret}")
    end

    # Returns the repository secret.
    #
    # Please note this api requires write access to the repository, and the request parameter {secret} is not the secret’s id but secret name.
    #
    # Reference: https://docs.drone.io/api/secrets/secret_info/
    def secret_info(owner, repo, secret)
      api.get("repos/#{owner}/#{repo}/secrets/#{secret}")
    end

    # Returns the repository secret list.
    #
    # Please note this api requires write access to the repository.
    #
    # Reference: https://docs.drone.io/api/secrets/secret_list/
    def secret_list(owner, repo)
      api.get("repos/#{owner}/#{repo}/secrets")
    end

    # Updates the specified repository secret.
    #
    # Please note this api requires write access to the repository, and the request parameter {secret} is not the secret’s id but secret name.
    #
    # Reference: https://docs.drone.io/api/secrets/secret_update/
    def secret_update(owner, repo, secret, **body)
      api.patch("repos/#{owner}/#{repo}/secrets/#{secret}", body)
    end

    # Returns the organizations secret list.
    #
    # Please note this api requires write access to the organizatiion.
    #
    def org_secret_list(owner)
      api.get("secrets/#{owner}")
    end
  end
end
