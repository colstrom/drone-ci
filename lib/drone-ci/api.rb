# frozen_string_literal: true

require_relative 'api/builds'
require_relative 'api/cron'
require_relative 'api/repos'
require_relative 'api/secrets'
require_relative 'api/templates'
require_relative 'api/user'
require_relative 'api/users'

module DroneCI
  module API
    include BuildsAPI
    include CronAPI
    include ReposAPI
    include SecretsAPI
    include TemplatesAPI
    include UserAPI
    include UsersAPI
  end
end
