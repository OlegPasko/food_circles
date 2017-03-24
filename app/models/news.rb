# frozen_string_literal: true
class News < ApplicationRecord
  dragonfly_accessor :mobile_image
  dragonfly_accessor :website_image

  # default_scope order('news.order ASC')

  # scope :website, where("website_image_uid IS NOT NULL")
  scope :mobile, -> { where('mobile_image_uid IS NOT NULL') }

  def as_json(_options = {})
    {
      id: id,
      title: title,
      mobile_url: mobile_url,
      website_url: website_url,
      mobile_image_url: mobile_image.try(:url),
      website_image_url: website_image.try(:url)
    }
  end
end
