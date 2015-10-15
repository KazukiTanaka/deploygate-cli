module Dgate
  module API
    module V1
      class Push
        ENDPOINT = "/users/%s/apps"

        class << self
          def upload(file_path, target_user, token, message, disable_notify = false)
            res = nil
            open(file_path) do |file|
              res = Base.new(token).post(
                sprintf(ENDPOINT, target_user),
                { :file => file , :message => message, :disable_notify => disable_notify ? 'yes' : 'no' })
            end

            return nil if res.nil?
            res
          end
        end
      end
    end
  end
end
