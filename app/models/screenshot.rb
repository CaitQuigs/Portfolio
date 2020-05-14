class Screenshot < ApplicationRecord
  belongs_to :project
  include ScreenshotUploader[:image]


end
