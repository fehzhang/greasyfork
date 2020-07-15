require 'active_support/concern'

module HasAttachments
  extend ActiveSupport::Concern

  included do
    has_many_attached :attachments

    validates :attachments,
              content_type: %w[image/png image/jpg image/jpeg],
              size: { less_than: Rails.configuration.screenshot_max_size },
              limit: { max: Rails.configuration.screenshot_max_count }
  end
end
