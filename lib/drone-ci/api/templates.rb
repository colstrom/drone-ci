# frozen_string_literal: true

module DroneCI
  module TemplatesAPI
    # https://docs.drone.io/api/templates/template_create/
    def template_create(namespace, **body)
      api.post("templates/#{namespace}", body)
    end

    # https://docs.drone.io/api/templates/template_delete/
    def template_delete(namespace, name)
      api.delete("templates/#{namespace}/#{name}")
    end

    # https://docs.drone.io/api/templates/template_info/
    def template_info(namespace, name)
      api.get("templates/#{namespace}/#{name}")
    end

    # https://docs.drone.io/api/templates/template_list/
    def template_list(namespace)
      api.get("templates/#{namespace}")
    end

    # https://docs.drone.io/api/templates/template_update/
    def template_update(namespace, name, **body)
      api.patch("templates/#{namespace}/#{name}", body)
    end
  end
end
