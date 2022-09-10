# frozen_string_literal: true

module DroneCI
  module CronAPI
    # https://docs.drone.io/api/cron/cron_create/
    def cron_create(owner, repo, **body)
      api.post("repos/#{owner}/#{repo}/cron", body)
    end

    # https://docs.drone.io/api/cron/cron_delete/
    def cron_delete(owner, repo, name)
      api.delete("repos/#{owner}/#{repo}/cron/#{name}")
    end

    # https://docs.drone.io/api/cron/cron_info/
    def cron_info(owner, repo, name)
      api.get("repos/#{owner}/#{repo}/cron/#{name}")
    end

    # https://docs.drone.io/api/cron/cron_list/
    def cron_list(owner, repo)
      api.get("repos/#{owner}/#{repo}/cron")
    end

    # https://docs.drone.io/api/cron/cron_trigger/
    def cron_trigger(owner, repo, name)
      api.post("repos/#{owner}/#{repo}/cron/#{name}")
    end

    # https://docs.drone.io/api/cron/cron_update/
    def cron_update(owner, repo, name, **body)
      api.patch("repos/#{owner}/#{repo}/cron/#{name}", body)
    end
  end
end
