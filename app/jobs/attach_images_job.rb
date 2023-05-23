class AttachImagesJob < ApplicationJob
  queue_as :default

  def perform
    AttachImagesService.new.call
  end
end
