# frozen_string_literal: true

module DroneCI
  module CronAPI
    # Create a new cron job.
    #
    # Please note this api requires write access to the repository.
    #
    # Reference: https://docs.drone.io/api/cron/cron_create/
    def cron_create(owner, repo, **body)
      api.post("repos/#{owner}/#{repo}/cron", body)
    end

    # Deletes a cron job.
    #
    # Please note this api requires write access to the repository.
    #
    # Reference: https://docs.drone.io/api/cron/cron_delete/
    def cron_delete(owner, repo, name)
      api.delete("repos/#{owner}/#{repo}/cron/#{name}")
    end

    # Returns the named cron job.
    #
    # Please note this api requires write access to the repository.
    #
    # Reference: https://docs.drone.io/api/cron/cron_info/
    def cron_info(owner, repo, name)
      api.get("repos/#{owner}/#{repo}/cron/#{name}")
    end

    # Returns the cron job list.
    #
    # Please note this api requires write access to the repository.
    #
    # Reference: https://docs.drone.io/api/cron/cron_list/
    def cron_list(owner, repo)
      api.get("repos/#{owner}/#{repo}/cron")
    end

    # Trigger an existing cron task.
    #
    # Please note this api requires write access to the repository.
    #
    # Reference: https://docs.drone.io/api/cron/cron_trigger/
    def cron_trigger(owner, repo, name)
      api.post("repos/#{owner}/#{repo}/cron/#{name}")
    end

    # Updates the named cron job.
    #
    # Please note this api requires write access to the repository.
    #
    # Reference: https://docs.drone.io/api/cron/cron_update/
    def cron_update(owner, repo, name, **body)
      api.patch("repos/#{owner}/#{repo}/cron/#{name}", body)
    end
  end
end
