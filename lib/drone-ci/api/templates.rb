# frozen_string_literal: true

module DroneCI
  module TemplatesAPI
    # Create a new template.
    #
    # Please note this api requires write access to the repository.
    #
    # Reference: https://docs.drone.io/api/templates/template_create/
    def template_create(namespace, **body)
      api.post("templates/#{namespace}", body)
    end

    # Deletes a template.
    #
    # Please note this api requires write access to the repository.
    #
    # Reference: https://docs.drone.io/api/templates/template_delete/
    def template_delete(namespace, name)
      api.delete("templates/#{namespace}/#{name}")
    end

    # Returns the template.
    #
    # Please note this api requires write access to the repository.
    #
    # Reference: https://docs.drone.io/api/templates/template_info/
    def template_info(namespace, name)
      api.get("templates/#{namespace}/#{name}")
    end

    # Returns the organization template list.
    #
    # Please note this api requires write access to the repository.
    #
    # Reference: https://docs.drone.io/api/templates/template_list/
    def template_list(namespace)
      api.get("templates/#{namespace}")
    end

    # Updates the specified repository secret.
    #
    # Please note this api requires write access to the repository, and the request parameter {secret} is not the secret’s id but secret name.
    #
    # Reference: https://docs.drone.io/api/templates/template_update/
    def template_update(namespace, name, **body)
      api.patch("templates/#{namespace}/#{name}", body)
    end
  end
end
